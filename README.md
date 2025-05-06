# GoogleSwitchPI
Program for raspberry pi 3 or higher to switch between google sheets and google calender. Useful for showing project progress or due dates excetera.

# Features

Displays a Google Sheet 
Displays a Google Calendar
Switches between the two every 90 seconds.
2-minute startup delay to stabilize the system.
Full-screen Chromium kiosk mode with no browser UI.
Hides mouse cursor for a clean display.
Autostarts on boot via systemd.
Lightweight and reliable for continuous operation.

# Important
This program is a quick project and as such is not spesifically made to support different users by default, so if your raspberry pi username is_different_than "pi", you will need to customize atleast the service script to support your username. Also you will need to manually edit the google-switch.sh script and put your own google calendar and google sheets urls in the marked spots at the start.

# About Google sheets and calendar
You can either make the sheets and calendar public from the settings of both if it doesn't matter that the contents of both are accessible to anyone on the internet. Alternatively you can make an account for the pi and add it to the sheet and calender or log in with the account both of them were created with. Below are some images that will help.

## Sharing in google sheets
You can share the google sheets privately to a google account of your choise (or make the sheets public) by clicking the blue "share" -button in the corner, which should a window like this below: 

![image](https://github.com/user-attachments/assets/b5e5a67d-7eb2-4be7-b49c-7af8ed6b5599)




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
## Enable Auto-Login by opening the configuration tool
  _sudo raspi-config_

Go to System Options > Boot / Auto Login > Desktop Autologin (select for user pi).
Save and exit.

## Verify Internet:
Test connectivity:
  _ping -c 4 google.com_

If no connection, configure Wi-Fi via raspi-config (System Options > Wireless LAN).

# 4. Install the Script

Copy or install the Script:
Save the script to /home/pi/google-switch.sh

## Make it Executable:
  _chmod +x /home/pi/google_switch.sh_

## Move the service file
Move the service file to _/etc/systemd/system/_ 

## Set permissions 
  _sudo chmod 644 /etc/systemd/system/google-switch.service_ 

## Enable the service
  _sudo systemctl enable google-switch.service_
  And start it:
  _sudo systemctl start google-switch.service_

# 5. Prevent screen blanking

Edit autostart:
  _sudo nano /etc/xdg/lxsession/LXDE-pi/autostart_

Add:
_@xset s off_
_@xset -dpms_
_@xset s noblank_
