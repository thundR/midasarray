client=$1
docker-compose run --rm openvpn easyrsa build-client-full $client nopass
docker-compose run --rm openvpn ovpn_getclient $client > $client.ovpn