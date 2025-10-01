
cat << 'EOF' > manwe.sh
#!/bin/bash

apt update
echo nameserver 192.168.122.1 > /etc/resolv.conf
EOF

chmod +x manwe.sh
./manwe.sh
