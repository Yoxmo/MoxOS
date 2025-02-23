#!/bin/bash

# Display info message
echo "Installing Applications"

# ------------------ APPLICATIONS -------------------

# Install required applications
sudo dnf install -y gnome-tweaks google-chrome-stable brightnessctl steam

# Grant Flatpak permissions
flatpak override --user --filesystem=~/.local/share/applications/ --filesystem=~/.local/share/icons

echo "[-] Done -> now installing icons..."

