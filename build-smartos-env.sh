#!/bin/bash

exit 0

# Build pkgin env.
mkdir -p /opt
cd /opt
curl -k http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-x86_64.tar.gz | gzcat | tar -xf -
mv /opt/local /opt
pkg_admin rebuild
pkgin up
pkgin install python27

# Ansible hosts.
[smartos-host]
10.11.0.11

[smartos-host:vars]
ansible_connection=ssh
ansible_ssh_user=root
ansible_ssh_pass=password-here
ansible_python_interpreter=/opt/local/bin/python

# for Ansible, set /etc/ansible/ansible.cfg 's "remote_tmp" value into '/tmp'
