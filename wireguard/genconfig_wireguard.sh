#!/bin/bash
client=$1
host_num=$(cat /etc/wireguard/host_num.txt)
new_num=$host_num+1

client_private=$(wg genkey)
client_public=$(echo $client_private | wg pubkey)

server_public=$(cat /etc/wireguard/public.key)
cat >> /etc/wireguard/wgnet0.conf <<EOF
# client $client
[Peer]
PublicKey = $client_public
AllowedIPs = 192.168.254.$host_num/32
EOF

echo $new_num > /etc/wireguard/host_num.txt

cat <<EOF
[Interface]
Address = 192.168.254.$host_num/24
PrivateKey = $client_private
DNS = 172.25.0.2

[Peer]
PublicKey = $server_public
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = midasarray.thundr.me:2071
EOF


