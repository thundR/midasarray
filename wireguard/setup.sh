#!/bin/bash
wg genkey | tee /etc/wireguard/private.key
cat /etc/wireguard/private.key | wg pubkey > /etc/wireguard/public.key
# sysctl -w net.ipv4.ip_forward=1

private=$(cat /etc/wireguard/private.key)
cat > /etc/wireguard/wgnet0.conf <<EOF
[Interface]
Address = 192.168.254.0/24
SaveConfig = true
ListenPort = 2071
PostUp = iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
PrivateKey = $private
EOF
