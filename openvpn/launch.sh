#!/bin/bash
# DNS_IP=$(docker inspect --format '{{ .NetworkSettings.Networks.midas_net.IPAddress }}' $(docker ps -aqf "name=dns"))
DNS_IP="172.75.0.2"
docker-compose run --rm openvpn ovpn_genconfig -p 'route 172.75.0.0 255.255.0.0' -u udp://midasarray.thundr.me -n $DNS_IP
docker-compose run --rm openvpn ovpn_initpki
