#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install python3
sudo apt -y install python3-pip
sudo pip install -U flask-cors
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt -y install nodejs
npm install -g @vue/cli

