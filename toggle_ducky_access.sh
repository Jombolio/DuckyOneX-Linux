#!/bin/bash
# Toggles udev rules for Ducky One X

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo ./toggle_ducky_access.sh [on|off])"
  exit 1
fi

if [ "$1" == "on" ]; then
  echo "Enabling Ducky One X WebHID access (0666 permissions)..."
  cp 99-ducky-onex.rules /etc/udev/rules.d/
  udevadm control --reload-rules
  udevadm trigger
  echo "Access ENABLED! Reconnect your keyboard to apply changes."
elif [ "$1" == "off" ]; then
  echo "Disabling Ducky One X WebHID access..."
  rm -f /etc/udev/rules.d/99-ducky-onex.rules
  udevadm control --reload-rules
  udevadm trigger
  echo "Access DISABLED! Reconnect your keyboard to apply changes."
else
  echo "Usage: sudo ./toggle_ducky_access.sh [on|off]"
  echo "  on  - Enables 0666 access for the Ducky keyboard"
  echo "  off - Removes the rule, reverting to standard secure permissions"
fi
