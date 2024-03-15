#!/bin/bash

# the directory to check
dir="/mnt/windows_share"

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

# loop through the files in the directory
for file in $dir/*.txt; do
    # get the filename
    filename=$(basename $file)
    # check if the file exists in the container
    if [ ! "$(docker exec $container ls /findams_javabackend/processed/$filename)" ]; then
        # copy the file to the container
        docker cp $file $container:/findams_javabackend/whonet
    fi
done
