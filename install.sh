# // .bin .bash - /bin/bash

echo "Welcome To MoxOS v1.2!"

sudo passwd fedora

# ------------------  APPLICATIONS -------------------

sudo dnf remove -y firefox
sudo dnf remove -y gnome-software
sudo dnf remove libreoffice* -y

rm -rf ~/.config/libreoffice
rm -rf ~/.libreoffice

sudo dnf autoremove -y


sudo flatpak install -y flathub com.mattjakeman.ExtensionManager

sudo dnf install -y gnome-tweaks
sudo dnf install -y google-chrome-stable
sudo dnf install -y brightnessctl 

sudo notify-send "Apps Updated" "brightnessctl SET 10%+ -10%"


flatpak override --user --filesystem=~/.local/share/applications/ --filesystem=~/.local/share/icons

echo "[-] Done now installing icons..."

# -------------------  ICON  ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
gnome-tweaks
sudo rm -r Tela-circle-icon-theme

echo "[-] Done now installing pixmaps..."

# --------------------- PIXMAPS -------------------

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/img/pixmaps.zip

sudo unzip pixmaps.zip
sudo rm -r /usr/share/pixmaps
sudo mv pixmaps /usr/share/pixmaps
sudo rm -f pixmaps.zip

cd ~

sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "/usr/share/plymouth/themes/spinner/watermark.png"
sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "~/Desktop/logo.png"

nautilus .

sudo dracut -f

echo "[+] Done now installing hostnames..."

# --------------------- HOSTNAME -------------------


sudo sed -i 's/^NAME=.*/NAME="MoxOS"/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME=MoxOS v1.12"/' /etc/os-release

#sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
#sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="rhgb quiet"/' /etc/default/grub

#sudo grub2-mkconfig -o /boot/grub2/grub.cfg
#sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

sudo hostnamectl set-hostname "MoxOS"

echo "[-] Done with Hostnames..."

# --------------------- PWA INSTALL -------------------

google-chrome youtube.com
google-chrome chatgpt.com

google-chrome https://chromewebstore.google.com/detail/popup-blocker-strict/aefkmifgmaafnojlojpnekbpbmjiiogg?hl=en
google-chrome https://chromewebstore.google.com/detail/adblock-for-youtube/cmedhionkhpnakcndndgjdbohmhepckk?hl=en

echo "[-] PWA Script execution completed."

rm -rf ~/.local/share/recently-used.xbel
history -c
