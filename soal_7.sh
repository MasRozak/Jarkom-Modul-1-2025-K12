#!/bin/bash
apt-get install vsftpd -y
apt-get install ftp -y

mkdir share
chmod 777 share

adduser ainur
chmod -d /share

adduser melkor

echo "ainur" > /etc/vsftpd.user_list
echo "melkor" >> /etc/vsftpd.user_list

service vsftpd restart
ftp 192.217.1.1 #dari client
