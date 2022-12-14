#!/bin/bash

if [[ "$(id -u)" != "0" ]]
then
	echo "Setup script should run as root!"
	exit 1
fi

set -x

# deny all connections by default
ufw default deny incoming
ufw default allow outgoing

# allow ssh and vpn connections
ufw allow 22		# ssh
ufw allow 51830		# wireguard

# Allow access to gitea services
ufw allow in on wg0 to any port 443 	# web version
ufw allow out on wg0 to any port 443

echo "Firewall configured successfully, to enable it run: 'ufw enable'"

