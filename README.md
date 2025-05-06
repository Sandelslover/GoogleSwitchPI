# GoogleSwitchPI
Program for raspberry pi 3 or higher to switch between google sheets and google calender. Useful for showing project progress or due dates excetera.


# 1. Hardware Requirements
Raspberry Pi 3 (Model B or B+) or higher.
MicroSD card (8GB or larger, 16GB+ recommended) with Raspberry Pi OS installed.
Power supply (5V, 2.5A micro-USB).
Internet connection (Wi-Fi or Ethernet).
Monitor or TV with HDMI cable (or HDMI-to-VGA adapter if needed).
If installing via ssh keyboard is not needed
Keyboard and mouse for initial setup.

# 2. Install Raspberry Pi OS
## Download Raspberry Pi OS
Use “Raspberry Pi OS with desktop” for this setup since we need a graphical interface.

## Flash the MicroSD Card:
Use a tool like Raspberry Pi Imager or Balena Etcher.
Insert the MicroSD card into your computer, select the downloaded OS image, and flash it to the card.

## Initial Boot Setup:
Insert the MicroSD card into the Pi, connect the monitor, keyboard, mouse,(if not setting up via ssh) and power supply.
Boot the Pi. Follow the setup wizard:
Set language, timezone and Wi-Fi credentials.
## Update the system:
  _sudo apt-get update && sudo apt-get upgrade -y_  


# 3. Configure the Raspberry Pi





Enable Auto-Login:





Open the configuration tool:
