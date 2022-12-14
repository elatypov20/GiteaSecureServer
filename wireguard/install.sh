#!/bin/bash

set -x

chmod +x generate_ip
chmod +x wg_new_user

cp generate_ip /usr/bin/
cp wg_new_user /usr/bin/

set +x 

echo "Please, enter current server ip address"
read -r ipaddr

set -x

sed -i "s/@@@server_ip/$ipaddr/g" /usr/bin/wg_new_user 
