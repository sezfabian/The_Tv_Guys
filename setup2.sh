#!/bin/bash

curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
bash install_nvm.sh
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
sudo nvm install --lts
sudo npm install -g npm@9.8.0
sudo npm install -g @vue/cli
sudo apt install mysql-server
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo export NVM_DIR="$HOME/.nvm"
sudo [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
sudo apt -y upgrade
sudo apt -y install python3
sudo apt -y install python3-pip
sudo pip install flask
sudo pip install -U flask-cors
sudo pip install pymysql
sudo pip install flask-bcrypt
pip install sqlalchemy
sudo systemctl start mysql.service

