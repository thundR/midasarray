#!/bin/bash

set -e

echo "$(date): Starting Wireguard"
wg-quick up wgnet0

# Handle shutdown behavior
finish () {
    echo "$(date): Shutting down Wireguard"
    wg-quick down wgnet0
    exit 0
}

trap finish SIGTERM SIGINT SIGQUIT

sleep infinity &
wait $!
