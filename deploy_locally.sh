#!/bin/bash

echo 'Do not forget to change the credentials in hosts.ini'
echo "Kill this process if you haven't changed them"
sleep 8

# Run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


echo 'This might take a while, be patient'

# Deploy
echo 'Updating..'
bash scripts/update.sh
# Install ansible
echo 'Installing Ansible..'
bash scripts/install-ansible.sh
# Start deploying
ansible-playbook deploy_kali.yml -i hosts.ini -e 'ansible_python_interpreter=/usr/bin/python3'
