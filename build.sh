#!/bin/bash
echo $1
vagrant ssh -c "cd /vagrant ; packer build -var 'password=$1'  machine_ansible.json"
