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
