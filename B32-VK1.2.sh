#!/bin/bash
set -e

# this updates
echo "Updating"
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y git cmake make gcc g++ python3 pkg-config binutils \
    libc6 libc6-dev libstdc++6 libstdc++6-dev libpthread-stubs0-dev \
    libgl1-mesa-dev libvulkan-dev binfmt-support

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

# this clones box64
echo -n "Cloning Box64"
git clone https://github.com/ptitSeb/box64 &>/dev/null
echo "Finished Cloning"

# now for building
cd box64

echo -n "Building and compiling Box64 with Box32"
mkdir -p build; cd build; cmake .. -D ARM_DYNAREC=ON -D CMAKE_BUILD_TYPE=RelWithDebInfo -D BOX32=ON -D BOX32_BINFMT=ON -D TEGRAX1=1
make -j4
echo "Finished Compiling"

# installing
echo "Installing Box64 and Box32"
sudo make install
box64 -v
echo "Rebooting in 10 seconds"
sleep 10
sudo reboot
