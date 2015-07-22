#!/bin/bash
# Ubuntu
. /etc/lsb-release
if [ ! -z "$DISTRIB_CODENAME" ]; then
  apt-get update && apt-get install -fy apt-get python-software-properties software-properties-common apt-transport-https
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9D8B80B
  add-apt-repository "deb [arch=amd64] https://osquery-packages.s3.amazonaws.com/${DISTRIB_CODENAME} ${DISTRIB_CODENAME} main"
  apt-get update && apt-get install -fy osquery
fi


cp /usr/share/osquery/osquery.example.conf /etc/osquery/osquery.conf
service osqueryd restart


# Centos 6

rpm -ivh https://osquery-packages.s3.amazonaws.com/centos6/noarch/osquery-s3-centos6-repo-1-0.0.noarch.rpm
yum install -y osquery
cp /usr/share/osquery/osquery.example.conf /etc/osquery/osquery.conf
service osqueryd restart

