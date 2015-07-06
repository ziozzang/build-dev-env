#!/bin/bash
apt-get update && apt-get install -fy software-properties-common python-software-properties
apt-add-repository -y ppa:ansible/ansible
apt-get update && apt-get install -fy ansible
