#!/usr/bin/env bash

sudo timedatectl set-timezone Asia/Tokyo

sudo apt-get install -y ansible
sudo ansible-playbook install.yaml

ansible-playbook setup.yaml
./deploy.sh
