#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install python3
sudo apt -y install python3-pip
sudo pip install -U flask-cors
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt -y install nodejs
npm install -g @vue/cli

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
sudo apt -y upgrade
sudo apt -y install python3
sudo apt -y install python3-pip
sudo pip install flask
sudo pip install -U flask-cors
sudo pip install pymysql
