#!/bin/bash
# Installs udev rules for Ducky One X

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo ./install_udev.sh)"
  exit
fi

echo "Installing udev rules for Ducky One X..."
cp 99-ducky-onex.rules /etc/udev/rules.d/
udevadm control --reload-rules
udevadm trigger

echo "Done! Reconnect your keyboard to apply changes."
