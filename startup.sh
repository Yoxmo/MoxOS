#!/bin/bash

# Display welcome message
echo "Welcome to MoxOS v1.2!"

# Change the password for the current user
sudo passwd "$(logname)"

# Remove keyring files
rm -rf ~/.local/share/keyrings

# Disable and mask dnf-makecache.timer and service
sudo systemctl disable --now dnf-makecache.timer
sudo systemctl mask dnf-makecache.service
