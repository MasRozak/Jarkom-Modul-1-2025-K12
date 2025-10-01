cat << 'EOF' > eru.sh

#!/bin/bash

apt update
apt install iptables -y
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.217.0.0/16
 
EOF
chmod +x eru.sh
./eru.sh