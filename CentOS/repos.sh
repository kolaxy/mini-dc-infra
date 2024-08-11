#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Step 1: Update the CentOS 7 system and reboot
echo "Updating CentOS 7 system..."
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo https://el7.repo.almalinux.org/centos/CentOS-Base.repo
sudo yum upgrade -y
echo "Update complete. Rebooting system..."
reboot

# After reboot, continue with the next steps

# Step 2: Install the elevate-release package
echo "Installing elevate-release package..."
sudo yum install -y http://repo.almalinux.org/elevate/elevate-release-latest-el$(rpm --eval %rhel).noarch.rpm

# Step 3: Install leapp packages
echo "Installing leapp packages..."
sudo yum install -y leapp-upgrade leapp-data-almalinux

# Step 4: Run pre-upgrade check
echo "Running pre-upgrade check..."
sudo leapp preupgrade

# Inform the user to review the pre-upgrade report
echo "Review the pre-upgrade report and apply necessary fixes as suggested."
echo "Once ready, start the upgrade process by running the next command."

# Step 5: Perform the upgrade
echo "Upgrading to AlmaLinux 8..."
sudo leapp upgrade

# Step 6: Reboot to complete the upgrade
echo "The upgrade process is complete. Rebooting the system..."
reboot

# After reboot, verify the upgrade
echo "After the system restarts, verify the upgrade to AlmaLinux 8 and check logs and packages from the previous OS version."

# Note for the user
echo "Don't forget to manually remove or update any leftover packages from the previous OS version."
