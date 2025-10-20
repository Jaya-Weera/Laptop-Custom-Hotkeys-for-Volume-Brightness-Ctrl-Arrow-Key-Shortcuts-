# 🎹 Laptop Custom Hotkeys for Volume & Brightness (Ctrl + Arrow Key Shortcuts)

A lightweight **AutoHotkey v2** script that adds **custom Ctrl + Arrow key shortcuts** for controlling **system volume and screen brightness** on any Windows laptop.  

Designed for quick, keyboard-based control — with a clean **on-screen display (OSD)** that appears briefly at the bottom center of your screen.

---

## 🎯 Features

✅ **Ctrl + Up / Down** → Adjust **system volume**  
✅ **Ctrl + Left / Right** → Adjust **screen brightness**  
✅ Minimal **white OSD** with:
- Compact popup near bottom center  
- Rounded corners, Segoe UI font  
- Auto-hides after 1 second  

Works on **Windows 10/11** with **AutoHotkey v2.0+**

---

## 💻 Demo

| Volume OSD | Brightness OSD |
|-------------|----------------|
| ![Volume](screenshots/demo_osd.png) | ![Brightness](screenshots/demo_osd.png) |

*(Add your screenshots in `/screenshots`.)*

---

## 🚀 Setup

1. **Install AutoHotkey v2**
   - [Download AutoHotkey v2](https://www.autohotkey.com/download/)

2. **Clone this repository**
   ```bash
   git clone https://github.com/<yourusername>/laptop-hotkeys.git
   cd laptop-hotkeys
Run the script

Double-click ctrl_media_hotkeys.ahk

A green “H” icon will appear in your system tray

Use the shortcuts

Ctrl + ↑ / Ctrl + ↓ → Volume up / down

Ctrl + ← / Ctrl + → → Brightness up / down

(Optional) — Add to startup

Press Win + R, type shell:startup, then press Enter

Copy or link the .ahk file into that folder

⚙️ Script Overview
🔈 Volume Control
Uses native AHK SoundGetVolume() and SoundSetVolume() to adjust system master volume smoothly.

💡 Brightness Control
Uses Windows WMI (root\WMI) interface:

text
Copy code
WmiMonitorBrightness
WmiMonitorBrightnessMethods
with Active=TRUE to adjust the current display brightness.

🪟 On-Screen Display (OSD)
Displays a small centered popup showing:

yaml
Copy code
🔊 Volume: 52%
💡 Brightness: 75%
White background

Rounded edges

Auto-hide after 1 second

🧩 File Structure
File	Description
ctrl_media_hotkeys.ahk	Main AutoHotkey script
.gitignore	Ignores build & cache files
LICENSE	MIT open-source license
README.md	Documentation
screenshots/	Optional image previews

⚠️ Notes
Works on most Windows laptops and PCs.

Requires AutoHotkey v2.0+ (not v1).

Brightness control may not work if your device uses custom GPU drivers that disable WMI access.

📜 License
This project is licensed under the MIT License — free to use, modify, and distribute.
See the LICENSE file for details.

❤️ Author
Jaya Weera
Full-Stack Developer & Tech Enthusiast
🌍 Sri Lanka






