#!/bin/bash

# Function to check if a command is available or not
function check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "$1 is not installed. Please install $1 before running this script."
    exit 1
  fi
}

# Check if required commands are available
check_command docker
check_command docker compose

# ./scripts/seed.sh ./db/db.sql.gz


# Run the application
./scripts/start.sh

# Wait for the application to start(until localhost:8080 is available)
while ! nc -z localhost 8080; do
  sleep 1
done
# Run the cron job
./scripts/cron.sh

cd /opt/FIND-AMS-DHIS2-app && sudo yarn build && sudo yarn deploy "http://localhost:8080" --username "admin" --password "district"