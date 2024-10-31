#!/bin/bash
sudo apt update
echo "Membuka port SSH"
sudo ufw allow ssh
sudo ufw enable
echo "Port SSH telah dibuka."
echo "Install Node js...."
apt install zip
sudo apt install htop
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm use --install-if-missing 22.11.0
sudo apt install screen
sudo apt install git
echo "Install Docker Engine...."
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Install Python...."
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.13
sudo ln -sf /usr/bin/python3 /usr/bin/python
echo "Install Rivalz Node...."
npm i -g rivalz-node-cli
echo "Install Nillion Verifier...."
docker pull nillion/verifier:v1.0.1
echo "Installing Dawn Internet Bot...."
git clone https://github.com/nadiva-anggraini/dawn-bot
cd dawn-bot
sudo apt install python3-pip
pip install -r requirements.txt
cd
echo "Done...."
