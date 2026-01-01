# dependencies
echo "Installing Dependencies"
sudo apt update
sudo apt install -y git cmake make gcc g++ python3 pkg-config binutils \
    libc6 libc6-dev libstdc++6 libstdc++6-dev libpthread-stubs0-dev \
    libgl1-mesa-dev libvulkan-dev binfmt-support

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
sudo systemctl restart systemd-binfmt
box64 -v
