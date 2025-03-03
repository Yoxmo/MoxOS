#!/bin/bash

# Display welcome message
echo "Welcome to MoxOS v1.2!"

# Change the password for the current user
sudo passwd "$(logname)"

# Remove keyring files
rm -rf ~/.local/share/keyrings

sudo sh -c 'echo "IdleActionSec=0" >> /etc/systemd/logind.conf'
echo "exclude=kernel*" | sudo tee -a /etc/dnf/dnf.conf > /dev/null


# Disable and mask dnf-makecache.timer and service
sudo systemctl disable --now dnf-makecache.timer
sudo systemctl mask dnf-makecache.service
