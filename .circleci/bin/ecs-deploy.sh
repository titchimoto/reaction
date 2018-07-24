#!/bin/bash

sudo apt-get -y install python3-pip wget
sudo pip3 install awscli
wget https://github.com/mikefarah/yq/releases/download/2.0.1/yq_linux_amd64 -O /tmp/yq
sudo mv /tmp/yq /usr/local/bin/yq
sudo chmod +x /usr/local/bin/yq

wget https://github.com/mozilla/sops/releases/download/3.0.5/sops_3.0.4_amd64.deb -O /tmp/sops_3.0.4_amd64.deb
sudo dpkg -i /tmp/sops_3.0.4_amd64.deb

cd devops/aws/app
source <(sops -d core-service/.env.sops) && ./update-app-stack.sh core-service
