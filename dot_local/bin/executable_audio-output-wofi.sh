#!/usr/bin/env bash

ACTIVE_SINK=$(pactl get-default-sink)

SINK_LINE=$(pactl list sinks | awk -v active="$ACTIVE_SINK" '
  /^\s+Name:/ {
    name=$2
    hdmi_num=""
    if (name ~ /HDMI[0-9]+/) {
      match(name, /HDMI([0-9]+)/, m)
      hdmi_num=m[1]
    }
  }

  /^\s+Description:/ {
    desc=substr($0, index($0,$2))

    if (desc ~ /HDMI/) {
      label="    HDMI " hdmi_num
    }
    else if (desc ~ /Speaker/) {
      label="   Speakers"
    }
    else if (desc ~ /Bluetooth/) {
      label="   Bluetooth"
    }
    else {
      label=desc
    }

    # Mark active sink
    if (name == active) {
      label=" " label
    }

    print label " ::: " name
  }
' | wofi --dmenu --prompt "Audio Output" --matching=fuzzy --format=s)

[ -z "$SINK_LINE" ] && exit 0

SINK_NAME=$(echo "$SINK_LINE" | awk -F " ::: " '{print $2}')

pactl set-default-sink "$SINK_NAME"

pactl list short sink-inputs | awk '{print $1}' | while read -r INPUT; do
  pactl move-sink-input "$INPUT" "$SINK_NAME"
done
