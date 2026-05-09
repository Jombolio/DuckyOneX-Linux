# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains Linux `udev` rules and an installation script to enable WebHID access for the Ducky One X keyboard (Vendor ID `0x3233`). It allows the official web configurator at [one-x.duckyhub.io/stroke](https://one-x.duckyhub.io/stroke) to communicate with the keyboard from a Chromium-based browser.

## Files

- `99-ducky-onex.rules` — udev rule granting `uaccess` (session-local user only) to all `hidraw` devices from vendor `3233`
- `install_udev.sh` — copies the rule to `/etc/udev/rules.d/`, then reloads and triggers udev

## Installation

```bash
sudo bash install_udev.sh
```

After running, the keyboard must be unplugged and reconnected.

## Key Design Decisions

- `TAG+="uaccess"` is used intentionally instead of `MODE="0666"` — this restricts access to the physically logged-in user via `systemd-logind`, preventing remote or background processes from accessing the keyboard input.
- The rule matches `KERNEL=="hidraw*"` and `SUBSYSTEM=="hidraw"` to target only raw HID nodes, not the higher-level input devices.
