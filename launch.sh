#!/bin/bash
docker-compose run --rm openvpn ovpn_genconfig -u udp://midasarray.thundr.me -n dns
docker-compose run --rm openvpn ovpn_initpki
docker-compose up


