#!/bin/bash

# Update the system and install necessary packages
sudo yum update -y
sudo yum install -y wget curl

# Install Docker
curl -sS https://get.docker.com/ | sh

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Install Outline server
bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"

# Display Docker status and Outline server installation output
sudo systemctl status docker
