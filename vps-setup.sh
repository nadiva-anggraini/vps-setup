#!/bin/bash

# Perbarui package manager
sudo apt update

# Install Node js
sudo apt install zip
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm use --install-if-missing 22.11.0

# Periksa apakah Screen terinstal, jika belum instal Screen
if ! command -v screen &> /dev/null; then
    echo "Screen tidak ditemukan, menginstal Screen..."
    sudo apt install -y screen || { echo "Gagal menginstal Screen. Keluar."; exit 1; }
else
    echo "Screen sudah terinstal."
fi

# Periksa apakah Git terinstal, jika belum instal Git
if ! command -v git &> /dev/null; then
    echo "Git tidak ditemukan, menginstal Git..."
    sudo apt install -y git || { echo "Gagal menginstal Git. Keluar."; exit 1; }
else
    echo "Git sudah terinstal."
fi

# Buka port SSH
echo "Membuka port SSH"
sudo ufw allow ssh
sudo ufw enable

# Konfirmasi pembukaan port
echo "Port SSH telah dibuka."
sudo ufw status
sudo apt install htop

# Install Docker Engine
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Python
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.13 -y
sudo ln -sf /usr/bin/python3 /usr/bin/python


# Install Rivalz Node
npm i -g rivalz-node-cli

# Install Nillion Verifier
docker pull nillion/verifier:v1.0.1