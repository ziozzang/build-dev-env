#!/bin/bash

mkdir -p /srv/jenkins

docker create \
  --restart=always \
  --name=jenkins \
  -v /srv/jenkins:/var/lib/jenkins \
  ziozzang/sshd:Ubuntu14.04
  
docker start jenkins

ansible-playbook -i hosts jenkins.yml
