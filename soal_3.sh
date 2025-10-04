#!/bin/bash

# Di melkor
cat <<EOF > /etc/network/interfaces

auto eth0
iface eth0 inet static
    address 192.217.1.2
    netmask 255.255.255.0
    gateway 192.217.1.1

EOF

# Di manwe
cat <<EOF > /etc/network/interfaces

auto eth0
iface eth0 inet static
    address 192.217.1.3
    netmask 255.255.255.0
    gateway 192.217.1.1

EOF

# Di varda
cat <<EOF > /etc/network/interfaces

auto eth0
iface eth0 inet static
    address 192.217.2.2
    netmask 255.255.255.0
    gateway 192.217.2.1

EOF

# Di ulmo
cat <<EOF > /etc/network/interfaces

auto eth0
iface eth0 inet static
    address 192.217.2.3
    netmask 255.255.255.0
    gateway 10.87.2.1

EOF