#!/bin/bash

# Display welcome message
echo "Welcome to MoxOS v1.2!"

# Change the password for the current user
sudo passwd "$(logname)"

# Remove keyring files
rm -rf ~/.local/share/keyrings

gsettings set org.gnome.desktop.user-accounts user-full-name "Acer PC"
sudo chfn -f "New Full Name" username


gsettings set org.gnome.desktop.session idle-delay 300
gsettings set org.gnome.settings-daemon.plugins.power ambient-dimming false


echo "exclude=kernel*" | sudo tee -a /etc/dnf/dnf.conf > /dev/null


# Disable and mask dnf-makecache.timer and service
sudo systemctl disable --now dnf-makecache.timer
sudo systemctl mask dnf-makecache.service
