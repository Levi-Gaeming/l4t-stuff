#warning
echo "THIS MIGHT HAVE WORSE PERFORMANCE COMPARED WINE WOW64"
echo "CTRL + C TO CANCEL THIS"
sleep 10s

# gets wine
echo "Getting Wine 9.17"
curl -L -O https://github.com/Kron4ek/Wine-Builds/releases/download/9.17/wine-9.17-amd64.tar.xz --silent --show-error
echo "Finished getting wine"

# extracting wine
echo "Extracting Wine"
tar -xJf wine-9.17-amd64.tar.xz
echo "Extracted Wine"

# registering components
echo "Registering Wine"
echo 'export PATH="$HOME/wine-9.17-amd64/bin:$PATH"' >> ~/.bashrc

# setting up wineprefix
export PATH="$HOME/wine-9.17-amd64/bin:$PATH"
export WINEARCH=win64
wine64 wineboot

# gecko + mono
echo "Installing Mono and Gecko"
curl -L -o $HOME/wine-9.17-amd64/wine-mono.msi https://dl.winehq.org/wine/wine-mono/9.3.0/wine-mono-9.3.0-x86.msi --silent --show-error
curl -L -o $HOME/wine-9.17-amd64/wine-gecko-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.4/wine-gecko-2.47.4-x86.msi --silent --show-error
curl -L -o $HOME/wine-9.17-amd64/wine-gecko-x64.msi https://dl.winehq.org/wine/wine-gecko/2.47.4/wine-gecko-2.47.4-x86_64.msi --silent --show-error
wine64 msiexec /i $HOME/wine-9.17-amd64/wine-mono.msi
wine64 msiexec /i $HOME/wine-9.17-amd64/wine-gecko-x86.msi
wine64 msiexec /i $HOME/wine-9.17-amd64/wine-gecko-x64.msi
source ~/.bashrc
