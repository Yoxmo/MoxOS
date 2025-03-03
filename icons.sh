#!/bin/bash
# ------------------- ICONS ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle"
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

sudo rm -r Tela-circle-icon-theme

cd ~/Pictures

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/wallpaper.zip

unzip wallpaper.zip

sudo rm -r /usr/share/backgrounds/fedora-workstation
sudo mkdir /usr/share/backgrounds/fedora-workstation

sudo cp -r ~/Pictures/wallpaper /usr/share/backgrounds/fedora-workstation

sudo mv ~/Pictures/wallpaper/f40-01-day.png /usr/share/backgrounds/f40/default/f40-01-day.png
sudo mv ~/Pictures/wallpaper/f40-01-night.png /usr/share/backgrounds/f40/default/f40-01-night.png

sudo rm -f wallpaper.zip

echo "[-] Done -> now installing pixmaps..."
