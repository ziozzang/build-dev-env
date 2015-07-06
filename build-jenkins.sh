#!/bin/bash
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
cat > /etc/apt/sources.list.d/jenkins.list << EOF
deb http://pkg.jenkins-ci.org/debian binary/
EOF
apt-get update && apt-get install -fy jenkins
service jenkins start
