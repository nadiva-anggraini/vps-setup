#!/bin/bash

# Perbarui package manager
sudo apt update

# Buka port SSH dan konfirmasi pembukaan port
echo "Membuka port SSH"
sudo ufw allow OpenSSH
sudo ufw --force enable
echo "Port SSH telah dibuka."
sudo ufw status

# Install Node.js
echo "Install Node.js..."
sudo apt install -y zip htop
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm use --install-if-missing 22.11.0

# Periksa apakah Screen terinstal, jika belum, instal Screen
if ! command -v screen &> /dev/null; then
    echo "Screen tidak ditemukan, menginstal Screen..."
    sudo apt install -y screen || { echo "Gagal menginstal Screen. Keluar."; exit 1; }
else
    echo "Screen sudah terinstal."
fi

# Periksa apakah Git terinstal, jika belum, instal Git
if ! command -v git &> /dev/null; then
    echo "Git tidak ditemukan, menginstal Git..."
    sudo apt install -y git || { echo "Gagal menginstal Git. Keluar."; exit 1; }
else
    echo "Git sudah terinstal."
fi

# Install Docker Engine
echo "Install Docker Engine...."
sudo apt-get install -y ca-certificates curl
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Python
echo "Install Python...."
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.13
sudo ln -sf /usr/bin/python3 /usr/bin/python

# Install Rivalz Node
echo "Install Rivalz Node...."
npm i -g rivalz-node-cli

# Install Nillion Verifier
echo "Install Nillion Verifier...."
docker pull nillion/verifier:v1.0.1

# Install Dawn Internet Bot
echo "Installing Dawn Internet Bot...."
git clone https://github.com/nadiva-anggraini/dawn-bot
pushd dawn-bot
sudo apt install -y python3-pip
pip install -r requirements.txt
popd
echo "Done...."
