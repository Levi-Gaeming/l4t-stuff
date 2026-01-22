#!/bin/bash
# gets wine
echo "Getting Wine"
cd
curl -L -O https://github.com/Azkali/Wine-Builds/releases/download/11.0-rc3-syscall-hack/wine-11.0-rc3-staging-tkg-amd64-wow64.tar.xz --silent --show-error
echo "Finished getting wine"

# extracting wine
echo "Extracting Wine"
tar -xJf wine-11.0-rc3-staging-tkg-amd64-wow64.tar.xz
echo "Extracted Wine"

# registering components
echo "Registering Wine"
echo 'export PATH="$HOME/wine-11.0-rc3-staging-tkg-amd64-wow64/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# setting up wineprefix
export PATH="$HOME/wine-11.0-rc3-staging-tkg-amd64-wow64/bin:$PATH"
export WINEARCH=win64
wine wineboot
echo "Should be ready!"
