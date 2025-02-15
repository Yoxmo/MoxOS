# 

echo "Welcome To MoxOS v1.2!"

MY_USR = $(whoami)

sudo passwd $MY_USR

sudo dnf -y update

# ------------------  APPLICATIONS -------------------

sudo dnf remove -y firefox
sudo flatpak install -y flathub com.mattjakeman.ExtensionManager

sudo dnf install -y gnome-tweaks
sudo dnf remove -y gnome-software
sudo dnf install -y google-chrome-stable

sudo flatpak override --user --filesystem=~/.local/share/applications/ --filepath=~/.local/share/icons

# ------------------  NAMEs -------------------

sudo sed -i 's/^Name=.*/Name=Word Docs/' /usr/share/applications/libreoffice-writer.desktop
sudo sed -i 's/^Name=.*/Name=Spreadsheet/' /usr/share/applications/libreoffice-calc.desktop
sudo sed -i 's/^Name=.*/Name=Presentation/' /usr/share/applications/libreoffice-impress.desktop

# -------------------  ICON  ---------------------

git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
sudo ./instal.sh
cd ..
sudo rm -r Tela-circle-icon-theme
sudo gnome-tweaks

# ------------------  KEYBINDS -------------------

sudo dnf install -y brightnessctl 

sudo notify-send "Settings Update" "brightnessctl SET 10%+ -10%"

# --------------------- PIXMAPS -------------------

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/img/pixmaps.zip

sudo unzip pixmaps.zip
sudo rm -r /usr/share/pixmaps
sudo mv pixmaps /usr/share/pixmaps
sudo rm -f pixmaps.zip

cd ~

cd /usr/share/plymouth/themes/bgrt
nautilus .
sudo dracut --force




