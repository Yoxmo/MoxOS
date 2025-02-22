# // .bin .bash - /bin/bash

echo "Welcome To MoxOS v1.2!"

sudo passwd "$(logname)"

rm -rf ~/.local/share/keyrings

sudo systemctl disable --now dnf-makecache.timer
sudo systemctl mask dnf-makecache.service


gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['F10']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['F8']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom0.name "Brightness Up"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom0.command "brightnessctl set 10%+"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom0.binding "F7"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom1.name "Brightness Down"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom1.command "brightnessctl set 10%-"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings.custom1.binding "F6"

gsettings set org.gnome.shell.keybindings toggle-overview "['F6']"

gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F5']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

echo "Keybindings restored!"


# ------------------  APPLICATIONS -------------------

sudo dnf remove -y firefox
sudo dnf remove -y gnome-software
sudo dnf remove -y mediawriter
sudo dnf remove -y gnome-boxes
sudo dnf remove -y connections
sudo dnf remove -y simple-scan

sudo dnf remove libreoffice* -y

rm -rf ~/.config/libreoffice
rm -rf ~/.libreoffice

sudo dnf autoremove -y


sudo dnf install -y gnome-tweaks
sudo dnf install -y google-chrome-stable
sudo dnf install -y brightnessctl 


sudo notify-send "Apps Updated" "brightnessctl SET 10%+ -10%"

sudo -u "$(logname)" flatpak override --user --filesystem=~/.local/share/applications/ --filesystem=~/.local/share/icons

echo "[-] Done -> now installing icons..."

# -------------------  ICON  ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
sudo -u "$(logname)" gnome-tweaks
sudo rm -r Tela-circle-icon-theme

echo "[-] Done -> now installing pixmaps..."

# --------------------- PIXMAPS -------------------

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/img/pixmaps.zip

sudo unzip pixmaps.zip
sudo rm -r /usr/share/pixmaps
sudo mv pixmaps /usr/share/pixmaps
sudo rm -f pixmaps.zip

cd ~

sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "/usr/share/plymouth/themes/spinner/watermark.png"
sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "~/Desktop/logo.png"

cd "/usr/share/plymouth/themes/"
nautilus .

sudo dracut -f

echo "[+] Done ->  now installing hostnames..."

# --------------------- HOSTNAME -------------------


sudo sed -i 's/^NAME=.*/NAME="MoxOS"/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="MoxOS v1.12"/' /etc/os-release

#sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
#sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="rhgb quiet"/' /etc/default/grub

#sudo grub2-mkconfig -o /boot/grub2/grub.cfg
#sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

sudo hostnamectl set-hostname "MoxOS"

echo "[-] Done with Hostnames..."

# --------------------- APPS INSTALL ------------------

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/Extensions.zip
unzip Extensions.zip

gnome-extensions install Compiz@Hermes.zip
gnome-extensions install AppHide@Lynithdev.zip
gnome-extensions install BlurShell@Aunetx.zip
gnome-extensions install DashDock@Micxgx.zip
gnome-extensions install LogoMenu@Aryan20.zip

gnome-extensions enable app-hider@lynith.dev
gnome-extensions enable logomenu@aryan_k
gnome-extensions enable compiz-windows-effect@hermes83.github.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable blur-my-shell@aunetx

echo "[-] Done with Apps... Finsih PWA and reboot."


# --------------------- PWA INSTALL -------------------

sudo rm -r  ~/.local/share/applications
sudo mkdir  ~/.local/share/applications

sudo cd ~/.local/share/applications
sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/applications.zip

sudo unzip applications.zip

sudo mkdir /usr/icons
sudo cd /usr/icons
curl -LO https://github.com/Yoxmo/MoxOS/releases/download/img/icons.zip

sudo unzip icons.zip


echo "[-] PWA Script execution completed. Rebooting now..."

rm -rf ~/.local/share/recently-used.xbel
history -c

reboot
