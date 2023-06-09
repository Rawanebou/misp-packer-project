#! /usr/bin/env bash

## This file is AUTOGENERATED.
## /!\ Do NOT Change the contents of the file.
## To generate it you need a copy of the main MISP repo.
## As a quick reference, you cat generate with xsnippet:
# $ xsnippet /tmp/ $PATH_TO_MISP/docs/generic/ethX.md
# $ cp /tmp/interfaces.sh .
echo "--- Using old style name (ethX) for interfaces"
sed -i 's/^\(GRUB_CMDLINE_LINUX=\).*/\1"net.ifnames=0 biosdevname=0"/' /etc/default/grub

# install ifupdown since ubuntu 18.04
sudo apt update
sudo apt install ifupdown -qqy

# enable eth0
echo "--- Configuring eth0"

cat >> /etc/network/interfaces << EOF
# The primary network interface
auto eth0
iface eth0 inet dhcp
EOF

update-grub > /dev/null 2>&1
