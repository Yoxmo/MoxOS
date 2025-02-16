# // bin bash

echo "Welcome To MoxOS v1.2!"

sudo passwd $(whoami)

# ------------------  APPLICATIONS -------------------

sudo dnf remove -y firefox
sudo dnf remove -y gnome-software

sudo flatpak install -y flathub com.mattjakeman.ExtensionManager

sudo dnf install -y gnome-tweaks
sudo dnf install -y google-chrome-stable
sudo dnf install -y brightnessctl 

sudo notify-send "Apps Updated" "brightnessctl SET 10%+ -10%"


sudo flatpak override --user --filesystem=~/.local/share/applications/ --filepath=~/.local/share/icons

# ------------------  NAMEs -------------------

sudo sed -i 's/^Name=.*/Name=Word Docs/' /usr/share/applications/libreoffice-writer.desktop
sudo sed -i 's/^Name=.*/Name=Spreadsheet/' /usr/share/applications/libreoffice-calc.desktop
sudo sed -i 's/^Name=.*/Name=Presentation/' /usr/share/applications/libreoffice-impress.desktop

# -------------------  ICON  ---------------------
cd ~
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && bash install.sh
cd ..
gnome-tweaks
sudo rm -r Tela-circle-icon-theme

# --------------------- PIXMAPS -------------------

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/img/pixmaps.zip

sudo unzip pixmaps.zip
sudo rm -r /usr/share/pixmaps
sudo mv pixmaps /usr/share/pixmaps
sudo rm -f pixmaps.zip

cd ~

sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "/usr/share/plymouth/themes/spinner/watermark.png"

cd /usr/share/plymouth/themes/bgrt
nautilus .

sudo plymouth-set-default-theme bgrt


sudo sed -i 's/^NAME=.*/NAME=MoxOS/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME=MoxOS v1.2/' /etc/os-release

sudo hostnamectl set-hostname "MoxOS v1.2"

sudo dnf autoremove
sudo dnf update -y

rm -rf ~/.local/share/recently-used.xbel
sudo history -c
rm ~/.zsh_history
