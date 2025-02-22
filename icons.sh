#!/bin/bash
# ------------------- ICONS ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle"
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

sudo rm -r Tela-circle-icon-theme
echo "[-] Done -> now installing pixmaps..."
