#!/bin/bash

# Download and install pixmaps
sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/pixmaps.zip
sudo unzip pixmaps.zip
sudo rm -r /usr/share/pixmaps
sudo mv pixmaps /usr/share/pixmaps
sudo rm -f pixmaps.zip

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/themes.zip
sudo unzip themes.zip
sudo rm -r /usr/share/plymouth/themes
sudo mv themes /usr/share/plymouth/themes
sudo rm -f themes.zip

# Rebuild initramfs
echo "\n\n[-] building initramfs this can take a while..."

sudo dracut -f

echo "[+] now installing hostnames..."

# --------------------- HOSTNAME -------------------

# Update system hostname
sudo sed -i 's/^NAME=.*/NAME="MoxOS"/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="MoxOS v1.12"/' /etc/os-release

# Set system hostname using hostnamectl
sudo hostnamectl set-hostname "MoxOS"

echo "[-] Done with Pixmaps & Hostnames..."

