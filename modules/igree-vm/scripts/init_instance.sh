#!/bin/bash

##Install docker
sudo apt-get update
sudo apt-get -yq install \
    apt-transport-https \
    ca-certificates \
    curl \
    telnet \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -yq docker-ce docker-ce-cli containerd.io

##Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


##Install iGree
sudo mkdir -p /igree/api/docker
cd /igree/api/docker
##Usando token do saka: #test-for-curl
# sudo curl -L "https://git.getdoc.com.br/iGree/igree-api/raw/homolog/docker/docker-compose.yml?private_token=b6TKgnr4zxh1Quzkmh5Y" -o /igree/api/docker/docker-compose.yml
# sudo docker-compose -f /igree/api/docker/docker-compose.yml up