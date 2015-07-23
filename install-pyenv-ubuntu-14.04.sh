#!/bin/bash

# wget -qO- https://raw.githubusercontent.com/ziozzang/build-dev-env/master/ubuntu/14.04/source.list > /etc/apt/sources.list
sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
apt-get update && apt-get -y -o Dpkg::Options::="--force-confold" upgrade
apt-get install -fy -qqy curl git-core sudo make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev

# INSTALL
curl -k -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

export PYENVPATH=$HOME/.pyenv
export PATH=$PYENVPATH/shims:$PYENVPATH/bin:$PATH
echo 'export PYENVPATH=$HOME/.pyenv' >> ~/.bashrc
echo 'export PATH=$PYENVPATH/shims:$PYENVPATH/bin:$PATH' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >>  ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >>  ~/.bashrc

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install $(pyenv install -l | grep " 2." | tail -n 1)
#pyenv global $(pyenv install -l | grep " 2." | tail -n 1)

