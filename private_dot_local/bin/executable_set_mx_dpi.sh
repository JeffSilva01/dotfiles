#!/bin/bash

DEVICE_NAME="Logitech MX Master 3S"
DPI_VALUE=3000

# Get logged-in user info
USER_NAME=$(who | awk '{print $1; exit}')
USER_ID=$(id -u "$USER_NAME")

# Get current DPI (extract only the number)
CURRENT_DPI=$(/usr/bin/ratbagctl "$DEVICE_NAME" dpi get 2>/dev/null | awk '{print $NF}')

# If DPI is already set, do nothing
if [ "$CURRENT_DPI" = "$DPI_VALUE" ]; then
  exit 0
fi

# Try to set the new DPI
if /usr/bin/ratbagctl "$DEVICE_NAME" dpi set "$DPI_VALUE"; then
  # Send notification only if DPI was successfully changed
  sudo -u "$USER_NAME" \
    DISPLAY=:0 \
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_ID/bus \
    notify-send -i input-mouse "Mouse Settings" \
    "Mouse DPI changed from $CURRENT_DPI to $DPI_VALUE"
fi
