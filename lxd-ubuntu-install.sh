#!/bin/bash
exit 0


# Install LXD
add-apt-repository -y ppa:ubuntu-lxc/lxd-git-master
apt-get update
apt-get install -fy lxd

# Get Images
lxd-images import lxc ubuntu trusty amd64 --alias ubuntu-14.04
lxd-images import lxc ubuntu precise amd64 --alias ubuntu-12.04
lxd-images import lxc centos 6 amd64 --alias centos-6
lxd-images import lxc centos 7 amd64 --alias centos-7
lxd-images import lxc debian jessie amd64 --alias debian-8
lxd-images import lxc debian wheezy amd64 --alias debian-7
lxd-images import lxc debian squeeze amd64 --alias debian-6

# Create Images
CID=${CID:-"first"}
IMG=${IMG:-"ubuntu-14.04"}
IPADDR="10.11.40.1/16"
IFS="/"; declare -a Array=($IPADDR)
IP1="${Array[0]}"
IP2="${Array[1]}"
lxc launch ${IMG} ${CID}
LXCSUBNET=`ip route | grep lxcbr0 | awk '{print $1}'`
INADDR=`lxc info ${CID} | grep eth0 | awk '{print $3}'`
while [  -z "${INADDR}" ]; do sleep 0.5 && INADDR=`lxc info ${CID} | grep eth0 | awk '{print $3}'`; done
lxc exec ${CID} -- apt-get update
# - Create SSH Configurations.
lxc exec ${CID} -- apt-get install -fy openssh-server iptables ufw
lxc exec ${CID} -- useradd ziozzang -m
lxc exec ${CID} -- bash -c "wget -qO- https://raw.github.com/ziozzang/home-server/master/install-new-user | /bin/bash"
lxc exec ${CID} -- reboot
ip addr add ${IP1}/${IP2} dev eth0
iptables -t nat -A PREROUTING -d ${IP1}/32 -p tcp -m comment --comment IPFW_${IP1} -j DNAT --to-destination ${INADDR}
iptables -t nat -A POSTROUTING -s "${LXCSUBNET}" -d ${INADDR} -p tcp -m comment --comment "IPFW_${IP1}" -j SNAT --to-source ${IP1}

# Delete
CID=${CID:-"first"}
lxc delete ${CID}
IPADDR="10.11.40.1/16"
IFS="/"; declare -a Array=($IPADDR)
IP1="${Array[0]}"
IP2="${Array[1]}"
ip addr del ${IP1}/${IP2} dev eth0
iptables-save | grep -v "IPFW_${IP1}" | iptables-restore


