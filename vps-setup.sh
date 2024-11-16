#!/bin/bash
sudo apt update &&
sudo ufw allow ssh &&
sudo apt install zip -y &&
sudo apt install htop -y &&
sudo apt install tmux -y &&
curl -fsSL https://fnm.vercel.app/install | bash &&
source ~/.bashrc &&
fnm use --install-if-missing 22.11.0 &&
sudo apt install git -y &&
sudo apt-get update &&
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt-get update &&
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
npm i -g rivalz-node-cli &&
docker pull nillion/verifier:v1.0.1 &&
mkdir -p nillion/verifier &&
docker run -v ./nillion/verifier:/var/tmp nillion/verifier:v1.0.1 initialise &&
git clone https://github.com/nadiva-anggraini/dawn-bot &&
sudo ln -sf /usr/bin/python3 /usr/bin/python &&
sleep 5 &&
cd dawn-bot &&
sudo apt install python3-pip -y &&
pip install -r requirements.txt &&
cd &&
screen -dmS dawn &&
screen -dmS rivalz &&
screen -dmS nillion &&
screen -S dawn -X stuff "cd dawn-bot\n" &&
python --version &&
node -v &&
docker version &&
sleep 5 &&
screen -S setup -X quit
