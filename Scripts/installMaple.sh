#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install docker.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
docker-compose --version
sudo chmod 666 /var/run/docker.sock


install tutor 
pip install "tutor[full]" --user
tutor local quickstart
 