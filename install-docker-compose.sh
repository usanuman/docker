#!/bin/sh
# https://techoverflow.net/2019/03/04/how-to-install-docker-docker-compose-on-ubuntu-in-1-minute/

# Install prerequisites
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# Add docker's package signing key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add repository
sudo add-apt-repository -y "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install latest stable docker stable version
sudo apt-get update
sudo apt-get -y install docker-ce

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
# Enable & start docker
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -a -G docker $USER

printf '\nDocker Compose installed successfully\n\n'

echo $(docker --version)

echo $(docker-compose --version)
