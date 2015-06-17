#!/bin/bash
wget -O /etc/apt/sources.list https://raw.githubusercontent.com/ziozzang/build-dev-env/master/ubuntu/14.04/source.list

apt-get update && apt-get upgrade -fy
apt-get install -fy screen tmux git-core python-pip apt-transport-https build-essential

wget -qO- https://get.docker.com/ | sh

