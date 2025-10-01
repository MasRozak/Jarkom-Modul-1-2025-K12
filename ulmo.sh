
cat << 'EOF' > ulmo.sh
#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf
EOF

chmod +x ulmo.sh
./ulmo.sh