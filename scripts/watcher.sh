#!/bin/bash

monitor_folder() {
    folder="$1"
    echo "Monitoring changes in $folder..."
    inotifywait -m -r -e create,delete,modify,move --format '%w%f %e' "$folder" |
        while read -r file event; do
            /opt/FIND_AMS_Deployment/scripts/whonet-sync.sh
        done
}

# Specify the folder you want to monitor
folder_to_watch="/home/ams/sambashare"

# Call the function in the background
monitor_folder "$folder_to_watch" &

# Keep the script running in the background
wait
