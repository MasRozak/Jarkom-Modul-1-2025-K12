# Internet

# Eru
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet dhcp


auto eth1
iface eth1 inet static
    address 192.217.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.217.2.1
    netmask 255.255.255.0
EOF

apt update && apt install -y iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.217.0.0/16

#Buat Node Ainur
echo "nameserver 192.168.122.1" > /etc/resolv.conf