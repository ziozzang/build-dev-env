#!/bin/bash

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
wget -O /etc/apt/sources.list https://raw.githubusercontent.com/ziozzang/build-dev-env/master/ubuntu/14.04/source.list

apt-get update && apt-get upgrade -fy
apt-get install -fy screen tmux git-core python-pip apt-transport-https build-essential
apt-get install -y lxc-docker

