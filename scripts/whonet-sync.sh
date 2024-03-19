#!/bin/bash

# the directory to check
dir="/home/ams/sambashare"

# processed is a directory inside dir
processed="$dir/processed"

# the container name
container="findams"

# check if the container exists
if [ ! "$(docker ps -q -f name=$container)" ]; then
    echo "Container $container does not exist"
    exit 1
fi

# check if the directory exists
if [ ! -d $dir ]; then
    echo "Directory $dir does not exist"
    exit 1
fi

for file in "$dir"/*.txt; do
    # get the filename
    filename=$(basename "$file")
    # remove spaces from filename
    new_filename="${filename// /}"
    # check if the file exists in the container
    if [ ! "$(docker exec "$container" ls /findams_javabackend/processed/"$new_filename")" ]; then
        # copy the file to the container with the new filename
        docker cp "$file" "$container":/findams_javabackend/whonet/"$new_filename"
    fi

    mv "$file" "$processed"/"$new_filename" && rm -f "$file"

done
