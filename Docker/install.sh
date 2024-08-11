#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Step 1: Install yum-utils
echo "Installing yum-utils..."
sudo yum install -y yum-utils

# Step 2: Add Docker repository
echo "Adding Docker repository..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Step 3: Install Docker Engine, containerd, and Docker Compose
echo "Installing Docker Engine, containerd, Docker Buildx, and Docker Compose plugins..."
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 4: Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Optional: Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Optional: Add current user to the docker group
# Uncomment the following line if you want to add the current user to the docker group
# echo "Adding current user to the docker group..."
# sudo usermod -aG docker $(whoami)

# Check Docker version to confirm installation
echo "Verifying Docker installation..."
docker --version
docker-compose --version

echo "Docker installation and setup complete."
