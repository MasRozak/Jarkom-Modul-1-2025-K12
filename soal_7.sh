#!/bin/bash
apt-get install vsftpd -y
apt-get install ftp -y

# Buat direktori share dan set owner ke ainur
mkdir /share
adduser ainur
adduser melkor

# Set owner dan permission direktori share hanya untuk ainur
chown ainur:ainur /share
chmod 750 /share

# Konfigurasi vsftpd untuk user-specific settings
mkdir -p /etc/vsftpd_user_conf

# Konfigurasi untuk user ainur - akses ke /share
cat <<EOF > /etc/vsftpd_user_conf/ainur
local_root=/share
write_enable=YES
EOF

# Konfigurasi untuk user melkor - akses terbatas ke home directory saja
cat <<EOF > /etc/vsftpd_user_conf/melkor
local_root=/home/melkor
write_enable=YES
EOF

# Update konfigurasi vsftpd utama
cat <<EOF >> /etc/vsftpd.conf

# Enable user-specific config
user_config_dir=/etc/vsftpd_user_conf

# User list settings
userlist_enable=YES
userlist_file=/etc/vsftpd.user_list
userlist_deny=NO

EOF

# Tambahkan user ke user list
echo "ainur" > /etc/vsftpd.user_list
echo "melkor" >> /etc/vsftpd.user_list

service vsftpd restart
ftp 192.217.1.1 #dari client
