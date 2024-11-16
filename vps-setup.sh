#!/bin/bash
sudo apt update
echo "Membuka port SSH"
sudo ufw allow ssh
sudo ufw enable
echo "Port SSH telah dibuka."
echo "Install Node js...."
sudo apt install zip
sudo apt install tmux -y
sudo apt install htop
echo "Install Nodejs...."
sleep 3
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm use --install-if-missing 22.11.0
sudo apt install screen -y
sudo apt install git
echo "Install Docker Engine...."
sleep 3
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "Install Python...."
sleep 3
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.13
sudo ln -sf /usr/bin/python3 /usr/bin/python
echo "Install Rivalz Node...."
sleep 3
npm i -g rivalz-node-cli
echo "Install Nillion Verifier...."
sleep 3
docker pull nillion/verifier:v1.0.1
echo "Installing Dawn Internet Bot...."
sleep 3
git clone https://github.com/nadiva-anggraini/dawn-bot
cd dawn-bot
sudo apt install python3-pip
pip install -r requirements.txt
cd
echo "Done...."
