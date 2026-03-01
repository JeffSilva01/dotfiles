#!/bin/bash

DEVICE_NAME="Logitech MX Master 3S"
DPI_VALUE=4000

# Get logged-in user info
USER_NAME=$(who | awk '{print $1; exit}')
USER_ID=$(id -u "$USER_NAME")

# Try to set the new DPI
if /usr/bin/ratbagctl "$DEVICE_NAME" dpi set "$DPI_VALUE"; then
  # Send notification only if DPI was successfully changed
  sudo -u "$USER_NAME" \
    DISPLAY=:0 \
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_ID/bus \
    notify-send -i input-mouse "Mouse Settings" \
    "Mouse DPI set $DPI_VALUE"
fi
