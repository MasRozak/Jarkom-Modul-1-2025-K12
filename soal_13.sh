#!/bin/bash

#di eru

apt-get update && apt-get install openssh-server -y
service ssh start

#Di varda

ssh eru@192.217.2.1