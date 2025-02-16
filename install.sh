# // .bin .bash - /bin/bash

echo "Welcome To MoxOS v1.2!"

sudo passwd $(whoami)

# ------------------  APPLICATIONS -------------------

sudo dnf remove -y firefox
sudo dnf remove -y gnome-software
sudo dnf remove libreoffice*

rm -rf ~/.config/libreoffice
rm -rf ~/.libreoffice

sudo dnf autoremove


sudo flatpak install -y flathub com.mattjakeman.ExtensionManager

sudo dnf install -y gnome-tweaks
sudo dnf install -y google-chrome-stable
sudo dnf install -y brightnessctl 

sudo notify-send "Apps Updated" "brightnessctl SET 10%+ -10%"


sudo flatpak override --user --filesystem=~/.local/share/applications/ --filepath=~/.local/share/icons


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
sudo cp "/usr/share/pixmaps/fedora-logo-sprite.png" "/home/Desktop/logo.png"

nautilus .

sudo dracut -f

sudo sed -i 's/^NAME=.*/NAME="MoxOS"/' /etc/os-release
sudo sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME=MoxOS v1.12"/' /etc/os-release

sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="rhgb quiet logo.nologo"/' /etc/default/grub

sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg


#!/bin/bash

install_extension() {
    extension_id=$1
    echo "Installing extension: $extension_id"
    google-chrome --install-extension="$extension_id"
}

create_pwa() {
    url=$1
    echo "Creating PWA for URL: $url"
    
    shortcut_name="${url//[:\/]/_}.desktop"
    shortcut_path="$HOME/Desktop/$shortcut_name"

    echo "[Desktop Entry]" > "$shortcut_path"
    echo "Version=1.0" >> "$shortcut_path"
    echo "Name=$url" >> "$shortcut_path"
    echo "Exec=google-chrome --profile-directory=Default --app=$url" >> "$shortcut_path"
    echo "Icon=google-chrome" >> "$shortcut_path"
    echo "Terminal=false" >> "$shortcut_path"
    echo "Type=Application" >> "$shortcut_path"

    chmod +x "$shortcut_path"
    echo "PWA shortcut created at $shortcut_path"
}

urls=(
    "https://youtube.com"
    "http://chatgpt.com"
    "https://drive.google.com"
    "https://mail.google.com"
    "https://docs.google.com"
    "https://sheets.google.com"
    "https://slides.google.com"
)

extensions=(
    "aefkmifgmaafnojlojpnekbpbmjiiogg"
    "cmedhionkhpnakcndndgjdbohmhepckk"
    "apdfllckaahabafndbhieahigkjlhalf"
)

for ext_id in "${extensions[@]}"; do
    install_extension "$ext_id"
done

for url in "${urls[@]}"; do
    create_pwa "$url"
done

echo "Script execution completed."



sudo hostnamectl set-hostname "MoxOS"

sudo dnf autoremove
sudo dnf update -y

rm -rf ~/.local/share/recently-used.xbel
history -c
