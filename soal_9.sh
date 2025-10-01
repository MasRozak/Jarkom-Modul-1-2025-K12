#!/bin/bash

apt update


#di eru
mkdir /etc/vsftpd_user_conf
echo "write_enable=NO" > /etc/vsftpd_user_conf/ainur
service vsftpd restart

cd /share
wget --no-check-certificate "http://drive.usercontent.google.com/u/0/uc?id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" -O kitab_penciptaan.zip

#di manwe
ftp 192.217.1.1
#login : ainur
get kitab_penciptaan.zip