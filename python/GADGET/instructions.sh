#!/bin/bash
# in wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
    ssid="YourSSID"
    psk="YourPassword"
}

# Enable gadet mode in config.txt
# do a distro check here.bullseye vs bookworm
dtoverlay=dwc2

# Open cmdline.txt and add modules-load=dwc2,g_ether immediately after rootwait.

sudo modprobe libcomposite

sudo mkdir -p /sys/kernel/config/usb_gadget/keyboard
cd /sys/kernel/config/usb_gadget/keyboard

echo 0x1d6b > idVendor  # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # Device release number
echo 0x0200 > bcdUSB    # USB version 2.0
mkdir -p strings/0x409
echo "4206980085" > strings/0x409/serialnumber
echo "RaspberryPi" > strings/0x409/manufacturer
echo "Pi Virtual Keyboard" > strings/0x409/product

mkdir -p configs/c.1/strings/0x409
echo "Config 1" > configs/c.1/strings/0x409/configuration
echo 120 > configs/c.1/MaxPower


mkdir -p functions/hid.usb0
echo 1 > functions/hid.usb0/protocol
echo 1 > functions/hid.usb0/subclass
echo 8 > functions/hid.usb0/report_length
echo -ne \\x05\\x01\\x09\\x02\\xa1\\x01\\x05\\x09\\x19\\x01\\x29\\x03\\x15\\x00\\x25\\x01\\x75\\x01\\x95\\x03\\x81\\x02\\xc0 > functions/hid.usb0/report_desc
ln -s functions/hid.usb0 configs/c.1/

# bind gadget
echo dwc2 > UDC

# test piKey.py needs sudo for virtual keyboard... but Im on a keyboard RN!

# in /etc/rc.local
# put your script in the $PATH (gotta pickone lol )
sudo echo "/$HOME/piGadget/piKey.sh" >> /etc/rc.local


