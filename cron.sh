#!/bin/bash

sudo chmod +x ./scripts/whonet-sync.sh

# create a cron job to run the script every 1 hour
(crontab -l 2>/dev/null; echo "0 * * * * /bin/bash /home/ubuntu/findams/scripts/whonet-sync.sh") | crontab -

# check if the cron job was created
crontab -l

