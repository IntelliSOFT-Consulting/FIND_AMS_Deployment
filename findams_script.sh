#!/bin/bash

# Function to check if a command is available or not
function check_command() {
  if ! command -v "$1" &>/dev/null; then
    echo "$1 is not installed. Please install $1 before running this script."
    exit 1
  fi
}

# Check if required commands are available
check_command docker
check_command docker compose

./scripts/seed.sh ./db/ams.sql

# Run the application
./scripts/start.sh

# wait for 2 minutes
sleep 60
cd /opt/FIND-AMS-DHIS2-app && sudo yarn build && sudo yarn deploy "http://localhost:8080" --username "admin" --password "district"

sudo cp ./config/whonet-watcher.service /etc/systemd/system/whonet-watcher.service
sudo cp ./scripts/watcher.sh /etc/watcher.sh
sudo chmod +x /etc/watcher.sh

sudo systemctl daemon-reload
sudo systemctl enable whonet-watcher.service
sudo systemctl start whonet-watcher.service

# Run the network script
./scripts/network.sh
