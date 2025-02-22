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

gnome-extensions install Compiz@Hermes.zip
gnome-extensions install AppHide@Lynithdev.zip
gnome-extensions install BlurShell@Aunetx.zip
gnome-extensions install DashDock@Micxgx.zip
gnome-extensions install LogoMenu@Aryan20.zip

echo "[-] Done with install... time to logout and check..."

gnome-session-quit --logout
