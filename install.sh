#!/bin/bash

# Display welcome message
echo "Welcome to MoxOS v1.2!"

# Change the password for the current user
sudo passwd "$(logname)"

# Remove keyring files
rm -rf ~/.local/share/keyrings

# Disable and mask dnf-makecache.timer and service
sudo systemctl disable --now dnf-makecache.timer
sudo systemctl mask dnf-makecache.service

# Set media keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['F10']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['F8']"

gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F4']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['F5', '<Alt>Tab']"



# Notify user that keybindings are restored
echo "Keybindings restored!"

# ------------------ APPLICATIONS -------------------

# Remove unwanted applications
sudo dnf remove -y firefox gnome-software mediawriter gnome-boxes connections simple-scan

sudo dnf remove libreoffice* -y

# Remove LibreOffice configuration files
rm -rf ~/.config/libreoffice
rm -rf ~/.libreoffice

# Perform autoremove to clean up unused packages
sudo dnf autoremove -y

# Install required applications
sudo dnf install -y gnome-tweaks google-chrome-stable brightnessctl

# Send notification about updated apps
sudo notify-send "Apps Updated" "brightnessctl SET 10%+ -10%"

# Grant Flatpak permissions
flatpak override --user --filesystem=~/.local/share/applications/ --filesystem=~/.local/share/icons

echo "[-] Done -> now installing icons..."

# ------------------- ICONS ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle"
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

sudo rm -r Tela-circle-icon-theme
echo "[-] Done -> now installing pixmaps..."

# --------------------- PIXMAPS -------------------

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
sudo dracut -f

echo "[+] Done -> now installing hostnames..."

# --------------------- HOSTNAME -------------------

# Update system hostname
sudo sed -i 's/^NAME=.*/NAME="MoxOS"/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="MoxOS v1.12"/' /etc/os-release

# Set system hostname using hostnamectl
sudo hostnamectl set-hostname "MoxOS"

echo "[-] Done with Hostnames..."

# --------------------- APPS INSTALL ------------------

# Download and install GNOME extensions
cd ~
mkdir tmpext
cd tmpext
sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/extents.zip
unzip extents.zip

echo "[-] Done with move..."

gnome-extensions install Compiz@Hermes.zip
gnome-extensions install AppHide@Lynithdev.zip
gnome-extensions install BlurShell@Aunetx.zip
gnome-extensions install DashDock@Micxgx.zip
gnome-extensions install LogoMenu@Aryan20.zip

echo "[-] Done with install..."

# Enable the installed extensions
gnome-extensions enable app-hider@lynith.dev
gnome-extensions enable logomenu@aryan_k
gnome-extensions enable compiz-windows-effect@hermes83.github.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable blur-my-shell@aunetx

echo "[-] Done with Apps... Finish PWA and reboot."

cd ~
rm -r tmpext



# --------------------- PWA INSTALL -------------------

# Setup applications for PWA
cd ~
sudo rm -r ~/.local/share/applications

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/applicationsdir.zip
sudo unzip 'applicationsdir.zip'

sudo mv 'applications (2)' ~/.local/share/applications

sudo chmod +rw ~/.local/share/applications

cd ~/.local/share/applications

sudo chmod +rw chrome-aghbiahbpaijignceidepookljebhfak-Default.desktop \
chrome-agimnkijcaahngcdmfeangaknmldooml-Default.desktop \
chrome-cadlkienfkclaiaibeoongdcgmdikeeg-Default.desktop \
chrome-fhihpiojkbmbpdjeoajapmgkhlnakfjf-Default.desktop \
chrome-fmgjjmmmlfnkbppncabfkddbjimcfncm-Default.desktop \
chrome-kefjledonklijopmnomlcbpllchaibag-Default.desktop \
chrome-mpnpojknpmmopombnjdcgaaiekajbnjb-Default.desktop

cd ~

echo "[-] PWA Script start"

sudo rm -f applicationsdir.zip

# Setup icons for PWA
cd ~ 
sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/icons.zip
sudo unzip icons.zip
sudo mv icons /usr/icons
echo "[-] PWA Script done"

sudo rm -f icons.zip

echo "[-] PWA Script execution completed. Rebooting now..."

# Clean up and reboot
rm -rf ~/.local/share/recently-used.xbel
history -c

# You should reboot
