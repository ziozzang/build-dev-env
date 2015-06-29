#!/bin/bash

cat > .toolboxrc <<EOF
TOOLBOX_DOCKER_IMAGE=ubuntu
TOOLBOX_DOCKER_TAG=14.04
EOF

toolbox bash -c "apt-get update && apt-get install -fy python"
toolbox bash -c "apt-get install -fy -qqy curl git-core sudo make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev"
toolbox bash -c "curl -k -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash"

echo 'export PYENVPATH=$HOME/.pyenv' > ~/.bashrc
echo 'export PATH=$PYENVPATH/shims:$PYENVPATH/bin:$PATH' >> ~/.bashrc
mkdir -p /opt/bin
cat > /opt/bin/python << EOF
#!/bin/bash
MOUNTS="/root:/root"
if [ "\$(id -u)" != "0" ]; then
  MOUNTS="/home:/home"
fi

toolbox --bind=\${MOUNTS} python "\$@"
EOF
cat > /opt/bin/pip << EOF
#!/bin/bash
MOUNTS="/root:/root"
if [ "\$(id -u)" != "0" ]; then
  MOUNTS="/home:/home"
fi

toolbox --bind=\${MOUNTS} pip "\$@"
EOF

cat > /opt/bin/tbsh << EOF
#!/bin/bash
MOUNTS="/root:/root"
if [ "\$(id -u)" != "0" ]; then
  MOUNTS="/home:/home"
fi

toolbox --bind=\${MOUNTS} bash "\$@"
EOF

chmod +x /opt/bin/python
chmod +x /opt/bin/pip
chmod +x /opt/bin/tbsh

