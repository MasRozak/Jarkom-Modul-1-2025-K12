#!/bin/bash

#Di Melkor
apt update && apt install netcat -y
nc -l -p 21 &
nc -l -p 80 &

/usr/sbin/vsftpd &

#di eru
apt-get update && apt-get install netcat -y


nc -v -z 192.217.1.2 21
nc -v -z 192.217.1.2 80
nc -v -z 192.217.1.2 666