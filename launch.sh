#!/bin/bash
# DNS_IP=$(docker inspect --format '{{ .NetworkSettings.Networks.midas_net.IPAddress }}' $(docker ps -aqf "name=dns"))
DNS_IP="172.75.0.2"
docker-compose run --rm openvpn ovpn_genconfig -u udp://midasarray.thundr.me -n $DNS_IP
docker-compose run --rm openvpn ovpn_initpki

