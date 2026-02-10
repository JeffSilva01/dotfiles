#!/bin/bash

options="  Desligar\n  Reiniciar\n  Suspender\n  Logout"

choice=$(echo -e "$options" | wofi --dmenu \
  --prompt "Power Menu" \
  --stylesheet ~/.config/wofi/power.css \
  --width 300 \
  --height 250 \
  --hide-scroll)

case $choice in
"  Desligar") systemctl poweroff ;;
"  Reiniciar") systemctl reboot ;;
"  Suspender") systemctl suspend ;;
"  Logout") hyprctl dispatch exit ;;
esac
