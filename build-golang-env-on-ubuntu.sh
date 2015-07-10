#!/bin/bash
exit 0

sudo apt-get install -fy curl build-essential bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# or
# wget -qO- https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
source ~/.gvm/scripts/gvm
[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"

gvm install go1.4.2
gvm use go1.4.2
go version


# PPA Installation
sudo add-apt-repository -y ppa:gophers/go
sudo apt-get update
sudo apt-get install -fy golang-stable
