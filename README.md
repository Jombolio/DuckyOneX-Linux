# Ducky One X Linux WebHID Support

This repository provides the necessary Linux `udev` rules to allow your Ducky One X keyboard to natively interface with the official configuration tool ([one-x.duckyhub.io/stroke](https://one-x.duckyhub.io/stroke)) on Linux.

By default, Linux distributions prevent standard users from reading and writing to raw HID devices for security reasons. This repository solves that by granting WebHID access strictly to the physical user logged into the active session.

## Installation

1. Clone this repository or download the files.
2. Open your terminal in the directory.
3. Run the installation script:
   ```bash
   sudo bash install_udev.sh
   ```
4. **Unplug your Ducky One X and plug it back in** to apply the new permissions.

## Usage

1. Open a **Chromium-based browser** (Google Chrome, Brave, Chromium, Microsoft Edge). 
   *(Firefox and Safari do not support the WebHID API.)*
2. Navigate to [https://one-x.duckyhub.io/stroke](https://one-x.duckyhub.io/stroke).
3. The site will prompt you to connect to a HID device. Select your Ducky One X and click "Connect".
4. You can now edit your onboard profiles, actuation points, and rapid trigger settings perfectly!

## Security

The included `99-ducky-onex.rules` uses the `TAG+="uaccess"` flag instead of universally open `0666` permissions. This ensures that only the user physically logged into the monitor and keyboard can access the device, protecting against background services or remote SSH users snooping on your keyboard.

## Compatibility

- **Device:** Ducky One X
- **Vendor ID:** `0x3233`
- **Supported Distros:** Ubuntu, Arch Linux, Fedora, Debian, and any distro utilizing `systemd-logind` and `udev`.
