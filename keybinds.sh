#!/bin/bash

# Display info message
echo "Now installing keybinds"

# Set media keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['F10']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['F8']"

gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F4']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['F5', '<Alt>Tab']"

# Notify user that keybindings are restored
echo "Keybindings restored!"
