#!/bin/bash
#set -xv
# get pkg dependencies
sudo apt install libxrandr-dev i2c-tools evdi-dkms dkms libdrm-dev libssl-dev  displaylink-driver xdg-utils
# ok the deal is I took some time to make all the parts off this thing to work. but I dont recall which
# things worked by default, and which required extra setup. 
# do we really need udev rules? im not sure

## Current functionality: everything that should work, does work. There is a memory device that stores the logo, 
## I havent figured out how to mod that logo yet, for when the board is on but the display is off.

# do you really need i2c-tools? IDK maybe if you want to addapt this to other ajazz models....
mkdir -p ~/.config/autostart

echo "
#!/bin/bash
export DISPLAY=:0
# Wait for the DisplayLink device to show up
for i in {1..10}; do
  if xrandr | grep -q "DVI-I-2"; then
    break
  fi
  sleep 1
done
# Add mode if not already present
xrandr | grep -q "1920x440_60.00" || \
  xrandr --newmode "1920x440_60.00" 58.25 1920 1968 2168 2416 440 443 453 460 -hsync +vsync
# Add mode to the DisplayLink device
xrandr --addmode DVI-I-2 "1920x440_60.00"
# Position it to the right of your TV (adjust if needed)
xrandr --output DVI-I-2 --mode "1920x440_60.00" --right-of HDMI-1
"

# > displayLink.sh
#chmod +x displayLink.sh

echo "
[Desktop Entry]
Type=Application
Exec=$HOME/displayLink.sh
Hidden=false
NoDisplay=false
X-MATE-Autostart-enabled=true
Name=DisplayLink Setup
" > ~/.config/autostart/displayLink.desktop

#ok ah.... xdg has some issues around scripting in the auto start functionality, 
# and I dont feel like ""making it work, or askiing the devs for a feature request.

# https://pastebin.com/7xfVYNX9
