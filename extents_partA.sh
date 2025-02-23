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

gnome install app-hider@lynith.dev
gnome install dash-to-dock@micxgx.gmail.com
gnome install blur-my-shell@aunetx
gnome install compiz-windows-effect@hermes83.github.com
gnome install logomenu@aryan_k


echo "[-] Done with install... time to logout and check..."

gnome-session-quit --logout
