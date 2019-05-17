#!/bin/bash

set -e

echo "$(date): Starting dnscrypt-proxy"
ip route add 192.168.255.0/24 via 172.75.0.3 dev eth0
/opt/dnscrypt-proxy

