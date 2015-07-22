#!/bin/bash
. /etc/lsb-release
if [ ! -z "$DISTRIB_CODENAME" ]; then
  apt-get update && apt-get install -fy apt-get python-software-properties software-properties-common apt-transport-https
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9D8B80B
  add-apt-repository "deb [arch=amd64] https://osquery-packages.s3.amazonaws.com/${DISTRIB_CODENAME} ${DISTRIB_CODENAME} main"
  apt-get update && apt-get install -fy osquery
fi