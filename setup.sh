#!/usr/bin/env bash

sudo timedatectl set-timezone Asia/Tokyo

sudo apt-get install -y ansible
ansible-playbook install.yaml
ansible-playbook setup.yaml
./deploy.sh
