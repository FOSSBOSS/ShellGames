#!/bin/bash
# in wpa_supplicant.conf
#ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
#update_config=1
#country=US

#network={
#    ssid="YourSSID"
#    psk="YourPassword"
#}

# Enable gadet mode in config.txt
# do a distro check here.bullseye vs bookworm

    code_name=$(cat /etc/os-release | grep VERSION_CODENAME=)
    cmd_file="/boot/firmware/cmdline.txt"
    code_name=${code_name#VERSION_CODENAME=}
    if [ "${code_name}" = "bookworm" ];then
        cmd_file="/boot/firmware/cmdline.txt"
        sudo echo "dtoverlay=dwc2" >> $cmd_file
        sudo echo "modules-load=dwc2,g_ether" >> $cmd_file
        if ! sudo bash -c "echo 'dtoverlay=dwc2' >> $cmd_file"; then
           echo "Failed to write to $cmd_file"
           exit 1
           fi
    elif [ "${code_name}" = "bullseye" ];then
        cmd_file="/boot/cmdline.txt" 
        sudo echo "dtoverlay=dwc2" >> $cmd_file
        sudo echo "modules-load=dwc2,g_ether" >> $cmd_file
        if ! sudo bash -c "echo 'dtoverlay=dwc2' >> $cmd_file"; then
           echo "Failed to write to $cmd_file"
           exit 1
           fi
    else
    echo "unknow distro. ... I dont know where your config files are"
    echo "it may be possible to set your pi as a gadet keyboard, "
    echo "with instructions from this script if you can properly  "
    echo "source your config.txt file"
    fi

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
#check pip for pynput library
depends="pynput"
    if pip show "$depends" &> /dev/null; then
        echo "$depends is installed."
    else
        echo "$depends is not installed. Install? press ENTER or CTRL+C to exit"
        pip install $depends # just do it lol
    fi
# in /etc/rc.local
# put your script in the $PATH (gotta pickone lol )
# might as well write the script now, and put it in a place.
#sudo echo "/$HOME/piGadget/piKey.sh" >> /etc/rc.local


