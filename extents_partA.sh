#!/bin/bash

# Download and install GNOME extensions
gnome-extensions disable background-logo@fedorahosted.org

cd ~
mkdir tmpext
cd tmpext
sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/extents.zip
unzip extents.zip

echo "[-] Done with move... installing now"

cd extents

gnome-extensions install app-hider@lynith.dev.zip
gnome-extensions install dash-to-dock@micxgx.gmail.com.zip
gnome-extensions install blur-my-shell@aunetx.zip
gnome-extensions install compiz-windows-effect@hermes83.github.com.zip
gnome-extensions install logomenu@aryan_k.zip


echo "[-] Done with install... time to logout and check..."

gnome-session-quit --logout
