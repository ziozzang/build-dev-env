#!/bin/bash

apt-add-repository -y ppa:vbernat/haproxy-1.5 && apt-get update && apt-get install -fy haproxy
