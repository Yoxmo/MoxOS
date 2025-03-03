#!/bin/bash
gnome-extensions list

echo "exclude=kernel*" | sudo tee -a /etc/dnf/dnf.conf > /dev/null

gnome-extensions list | xargs -n 1 gnome-extensions enable

# Enable the installed extensions
gnome-extensions enable app-hider@lynith.dev
gnome-extensions enable logomenu@aryan_k
gnome-extensions enable compiz-windows-effect@hermes83.github.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable blur-my-shell@aunetx

echo "[-] Done with Apps... Finish PWA and reboot."

# Clean up and reboot
rm -rf ~/.local/share/recently-used.xbel
history -c

# You should reboot
