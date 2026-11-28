#!/bin/bash
component=$1
environment=$2
app_version=$3
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/kprasadreddy27/roboshop-ansible-v3.git
cd roboshop-ansible-v3
git pull 
ansible-playbook -e component=${component} -e env=${environment} -e app_version=${app_version} main.yaml