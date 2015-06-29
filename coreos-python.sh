#!/bin/bash

# Set Toolbox Env. (Default Toolbox is Fedora. but I prefer Ubuntu.)
cat > ~/.toolboxrc <<EOF
TOOLBOX_DOCKER_IMAGE=ubuntu
TOOLBOX_DOCKER_TAG=14.04
EOF

cat > ~/.bashrc << EOF
export PATH=$PATH:/opt/bin
EOF

# Install busybox-like Toolbox command at /opt/bin/
mkdir -p /opt/bin
cat > /opt/bin/tbsh << EOF
#!/bin/bash
MOUNTS="/root:/root"
if [ "\$(id -u)" != "0" ]; then
  MOUNTS="/home:/home"
fi

execmd=\${0##*/}
if [ "\$execmd" == "tbsh" ]; then
  execmd="bash"
fi

toolbox --bind=${MOUNTS} --bind=/opt:/opt \${execmd} "\$@"
EOF

# Create Links.
chmod +x /opt/bin/tbsh
ln -s /opt/bin/tbsh /opt/bin/python
ln -s /opt/bin/tbsh /opt/bin/pip
ln -s /opt/bin/tbsh /opt/bin/pyenv
ln -s /opt/bin/tbsh /opt/bin/apt-get
ln -s /opt/bin/tbsh /opt/bin/apt-cache

apt-get update && apt-get install -fy python python-pip
apt-get install -fy -qqy curl git-core sudo make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev

pip install flask
# PYENV_ROOT
