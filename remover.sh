#!/bin/bash

# Display info message
echo "Removing Applications"

# Remove unwanted applications
sudo dnf remove -y firefox gnome-software mediawriter gnome-boxes connections simple-scan

sudo dnf remove libreoffice* -y

# Remove LibreOffice configuration files
rm -rf ~/.config/libreoffice
rm -rf ~/.libreoffice

# Perform autoremove to clean up unused packages
sudo dnf autoremove -y
