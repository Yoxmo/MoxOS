#!/bin/bash

# Display info message
echo "Now installing keybinds"

# Set media keybindings
sudo gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['F10']"
sudo gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['F9']"
sudo gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['F8']"

sudo gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F4']"
sudo gsettings set org.gnome.desktop.wm.keybindings switch-applications "['F5', '<Alt>Tab']"

cd ~/Pictures

curl -LO ttps://github.com/Yoxmo/MoxOS/releases/download/pkg/wallpaper.zip

sudo rm -r /usr/share/backgrounds/fedora-workstation

sudo cp -r ~/Pictures/wallpaper /usr/share/backgrounds/fedora-workstation

sudo mv ~/Pictures/wallpaper/f40-01-day.png /usr/share/backgrounds/f40/default/f40-01-day.png
sudo mv ~/Pictures/wallpaper/f40-01-night.png /usr/share/backgrounds/f40/default/f40-01-night.png

# Notify user that keybindings are restored
echo "Keybindings restored!"
