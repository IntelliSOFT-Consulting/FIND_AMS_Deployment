#!/bin/bash

# get the server ip
server_ip=$(grep -oP "SERVER_IP=\K.+" .env)
net_mask=$(grep -oP "NET_MASK=\K.+" .env)

# create the set-ip.sh file inside /etc/ directory and make it executable. The script will be "sudo ifconfig eno8 192.168.40.110 netmask 255.255.255.0;"

echo "sudo ifconfig eno8 $server_ip netmask $net_mask;" > /etc/set-ip.sh
sudo chmod +x /etc/set-ip.sh

sudo cp ./config/set-network.service /etc/systemd/system/set-network.service
sudo systemctl daemon-reload
sudo systemctl enable set-network.service
sudo systemctl start set-network.service

