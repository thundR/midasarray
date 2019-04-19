#!/bin/bash
set -e
python /opt/domain-blacklists/generate-domains-blacklist.py -i -c /opt/domain-blacklists/domains-blacklist.conf > /opt/blacklist.txt
