#!/bin/bash

# Set the Windows username. Modify the following line if the Ubuntu username is different.
windows_user="$USER"

# Install Linux Kernel 5.15 for WSL2
# https://github.com/microsoft/WSL2-Linux-Kernel

sudo apt update
sudo apt upgrade
sudo apt install build-essential flex bison dwarves libssl-dev libelf-dev
git clone --branch linux-msft-wsl-5.15.167.4 --single-branch --depth 1 --recurse-submodules 'https://github.com/microsoft/WSL2-Linux-Kernel.git'
cd WSL2-Linux-Kernel
make KCONFIG_CONFIG=Microsoft/config-wsl -j$(nproc)
sudo make modules_install
sudo make install
sudo cp /boot/vmlinuz-5.15.167.4-microsoft-standard-WSL2+ /mnt/c/Users/$windows_user/vmlinuz-5.15.167.4-microsoft-standard-WSL2+
printf '[wsl2]\nkernel=C:\\\\Users\\\\%s\\\\vmlinuz-5.15.167.4-microsoft-standard-WSL2+\n' "$windows_user" | sudo tee --append /mnt/c/Users/$windows_user/.wslconfig 
