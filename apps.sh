#!/bin/bash

cd ~
sudo rm -r ~/.local/share/applications

sudo curl -LO https://github.com/Yoxmo/MoxOS/releases/download/pkg/applicationsdir.zip
sudo unzip 'applicationsdir.zip'

sudo mv 'applications (2)' ~/.local/share/applications

sudo chmod +rw ~/.local/share/applications

cd ~/.local/share/applications

sudo chmod +rw chrome-aghbiahbpaijignceidepookljebhfak-Default.desktop \
chrome-agimnkijcaahngcdmfeangaknmldooml-Default.desktop \
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
