# Ducky One X Linux WebHID Support

This repository provides the necessary Linux `udev` rules to allow your Ducky One X keyboard to natively interface with the official configuration tool ([one-x.duckyhub.io/stroke](https://one-x.duckyhub.io/stroke)) on Linux.

By default, Linux distributions prevent standard users from reading and writing to raw HID devices for security reasons. Because standard access tags can sometimes fail, this repository uses universally open `0666` permissions. To mitigate security risks, a toggle script is provided so you can enable access only when needed.

## Installation & Usage

1. Clone this repository or download the files.
2. Open your terminal in the directory.
3. Enable keyboard access by running:
   ```bash
   sudo ./toggle_ducky_access.sh on
   ```
4. **Unplug your Ducky One X and plug it back in** to apply the new permissions.

## Usage

1. Open a **Chromium-based browser** (Google Chrome, Brave, Chromium, Microsoft Edge). 
   *(Firefox and Safari do not support the WebHID API.)*
2. Navigate to [https://one-x.duckyhub.io/stroke](https://one-x.duckyhub.io/stroke).
3. The site will prompt you to connect to a HID device. Select your Ducky One X and click "Connect".
4. You can now edit your onboard profiles, actuation points, and rapid trigger settings perfectly!

## Security

The included `99-ducky-onex.rules` uses universally open `0666` permissions to ensure reliable detection across all browser setups. This theoretically allows any user or background service on the machine to interact with the keyboard. **To ensure your system remains secure, always run the toggle script with the `off` argument when you are done configuring your device:**

```bash
sudo ./toggle_ducky_access.sh off
```
After running the command, unplug and replug the keyboard to secure it.

## Compatibility

- **Device:** Ducky One X
- **Vendor ID:** `0x3233`
- **Supported Distros:** Ubuntu, Arch Linux, Fedora, Debian, and any distro utilizing `systemd-logind` and `udev`.
