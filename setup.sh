#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "Installer must be run as root."
	echo "Try 'sudo bash $0'"
	exit 1
fi
echo "Script made by @DrekkTheProto, Face made by @jtingF"
echo "Go throw money at him: https://www.patreon.com/JtingF"


echo "Downloading scripts"
wget https://raw.githubusercontent.com/DrekkTheProto/ProtoExampleCode/master/owo-pi.py
wget https://raw.githubusercontent.com/DrekkTheProto/ProtoExampleCode/master/owo-pi-anim.py
wget https://raw.githubusercontent.com/DrekkTheProto/ProtoExampleCode/master/owo-pi%20-%20fullframe.py
echo "Installing dependiencies"
apt update
apt install -y --force-yes python3-pil python3-numpy
echo "Downloading adafruit setup script"
curl https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/main/rgb-matrix.sh > rgb-matrix.sh
echo "If you're using the default bonnet, you want to use the \"Convenience\" setting"
echo "Running installer script, make sure you reboot afterwards"
echo "When the reboot is done, run the owo-pi.py script for blinky blink OwO face"
source rgb-matrix.sh