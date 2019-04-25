# midasarray

This is a small project to Dockerize a VPN/DNS filter combo. With dnscrypt-proxy and openvpn, we have a simple system that allows for VPNs on any client as well as ad-blocking and tracker-blocking DNS. 

This could also be expanded to form a set of containerized services only available through the VPN tunnel. 

## Usage

Pull down the repo to a VPS

Run `bash launch.sh`

Run `bash gen_config.sh clientname`

Give the resulting .ovpn profile to your client!