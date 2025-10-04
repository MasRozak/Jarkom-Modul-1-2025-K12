#!/bin/bash

#DI Melkor
adduser eruu
apt update && apt install telnetd -y
apt install openbsd-inetd -y
echo "telnet stream tcp nowait root /usr/sbin/telnetd telnetd" >> /etc/inetd.conf
service openbsd-inetd restart

#Di Eru
apt-get update && apt-get install telnet -y
telnet 192.217.2.1
#login : eruu
#password : eru