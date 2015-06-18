#!/bin/bash
wget -qO- https://raw.githubusercontent.com/ziozzang/build-dev-env/master/ubuntu/14.04/source.list > /etc/apt/sources.list

apt-get update && apt-get -fy -o Dpkg::Options::="--force-confold" upgrade
apt-get install -fy screen tmux git-core python-pip apt-transport-https build-essential vim

wget -qO- https://get.docker.com/ | sh

