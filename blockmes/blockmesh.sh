#!/bin/bash

# Detect system architecture
ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ]; then
    CLI_URL="https://github.com/block-mesh/block-mesh-monorepo/releases/download/v0.0.325/blockmesh-cli-aarch64-unknown-linux-gnu.tar.gz"
elif [ "$ARCH" = "x86_64" ]; then
    CLI_URL="https://github.com/block-mesh/block-mesh-monorepo/releases/download/v0.0.325/blockmesh-cli-x86_64-unknown-linux-gnu.tar.gz"
else
    echo "Unsupported architecture."
    exit 1
fi

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install curl if not already installed
if ! command -v curl &> /dev/null; then
    sudo apt install -y curl
fi

# Create blockmesh folder if it doesn't already exist
mkdir -p ~/blockmesh

# Download and extract CLI
curl -L "$CLI_URL" -o blockmesh-cli.tar.gz
tar -xzf blockmesh-cli.tar.gz --strip-components=3 -C ~/blockmesh
rm blockmesh-cli.tar.gz

# Grant execute permission to blockmesh-cli file
chmod +x ~/blockmesh/blockmesh-cli

# Prompt for email and password
read -p "Enter your BlockMesh email: " email
read -s -p "Enter your BlockMesh password: " password
echo

# Create systemd configuration file
cat << EOF | sudo tee /etc/systemd/system/blockmesh.service
[Unit]
Description=Blockmesh CLI Service
After=network.target

[Service]
ExecStart=/root/blockmesh/blockmesh-cli login --email $email --password $password
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable the service
sudo systemctl daemon-reload
sudo systemctl enable blockmesh.service
sudo systemctl start blockmesh.service

echo "BlockMesh CLI has been successfully installed and the service has started."
