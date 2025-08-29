#!/bin/bash

# Install Radeon software for WSL with ROCm
# https://rocm.docs.amd.com/projects/radeon/en/latest/docs/install/wsl/install-radeon.html


# Extract the Ubuntu version from /etc/os-release
UBUNTU_VERSION=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2)

# Execute commands based on the Ubuntu version
if [[ "$UBUNTU_VERSION" == "22.04" ]]; then
    echo "Running Ubuntu 22.04"
    # Commands for Ubuntu 22.04
    sudo apt update
    wget https://repo.radeon.com/amdgpu-install/6.4.2.1/ubuntu/jammy/amdgpu-install_6.4.60402-1_all.deb
    sudo apt install ./amdgpu-install_6.4.60402-1_all.deb

elif [[ "$UBUNTU_VERSION" == "24.04" ]]; then
    echo "Running Ubuntu 24.04"
    # Commands for Ubuntu 24.04
    sudo apt update
    wget https://repo.radeon.com/amdgpu-install/6.4.2.1/ubuntu/noble/amdgpu-install_6.4.60402-1_all.deb
    sudo apt install ./amdgpu-install_6.4.60402-1_all.deb

else
    echo "Unsupported Ubuntu version: $UBUNTU_VERSION"
    exit 1
fi

# Install the ROCm software stack
amdgpu-install -y --usecase=wsl,rocm --no-dkms
