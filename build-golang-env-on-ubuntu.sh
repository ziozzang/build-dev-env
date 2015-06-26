#!/bin/bash

sudo apt-get install -fy curl build-essential bison

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# or
# wget -qO- https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash


source ~/.gvm/scripts/gvm
[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"

gvm install go1.4.2
gvm use go1.4.2
go version
