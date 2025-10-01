
cat << 'EOF' > varda.sh
#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf
EOF

chmod +x varda.sh
./varda.sh