#!/bin/bash
apt update
apt install unzip
wget --no-check-certificate "http://drive.usercontent.google.com/u/0/uc?id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" -O traffic.zip
unzip traffic.zip
chmod +x traffic.sh
./traffic.sh