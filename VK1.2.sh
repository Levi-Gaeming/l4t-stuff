#!/bin/bash
set -e

# this updates
echo "Updating"
sudo apt update
sudo apt dist-upgrade -y

# this adds support for the BSP
echo "Adding support for the new BSP"
echo "deb [signed-by=/etc/apt/keyrings/theofficialgman-L4T.asc] https://theofficialgman.github.io/l4t-debs/ l4t noble-32-7" | sudo tee /etc/apt/sources.list.d/theofficialgman-L4T-32-7.list

# this removes restrictions
echo "Removing BSP restrictions"
sudo rm -f /etc/apt/preferences.d/00-switch-bsp-restrictions

# this updates again and installs the new BSP
echo "Installing the new BSP"
sudo apt update
sudo apt install -y -o Dpkg::Options::="--force-confdef" nvidia-bsp-32-7

# auto reboot
echo "Rebooting in 10 seconds"
sleep 10
sudo reboot
