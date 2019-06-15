#!/bin/bash

# Ubuntu (GNOME) 19.04 setup script.

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebia

# Initial Software

sudo apt update

sudo apt install net-tools htop grsync lame asunder soundconverter brasero git mc flatpak \
openssh-server sshfs gedit-plugin-text-size simplescreenrecorder nano \
ubuntu-restricted-extras mpv vlc gthumb gnome-tweaks tracker chrome-gnome-shell \
gnome-tweak-tool qt5-style-plugins spell synaptic -yy

# Add me to any groups I might need to be a part of:

sudo adduser $USER other user

#ppa's
sudo add-apt-repository ppa:lutris-team/lutris 
sudo apt-add-repository ppa:dolphin-emu/ppa
sudo add-apt-repository ppa:pcsx2-team/pcsx2-daily
udo add-apt-repository ppa:obsproject/obs-studio

# update stuff
sudo apt-get update 

# Remove undesirable packages:

sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor
sudo apt install gnome-characters gnome-calculator gnome-system-monitor \
gnome-software-plugin-flatpak -yy

#set icons to minimize on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

## Remove junk
sudo apt-get remove ubuntu-web-launchers thunderbird rhythmbox -y

## Multimedia
sudo apt-get install -y gimp 
sudo apt-get install -y kdeconnect
sudo apt-get install -y obs-studio

## Games
sudo apt-get install -y steam-installer
sudo apt-get install -y lutris
sudo apt-get install -y dolphin-emu-master
sudo apt-get install -y pcsx2 unstable

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# set Qt variable in /etc/environment:

sudo bash -c "echo 'QT_QPA_PLATFORMTHEME=gtk2' >> /etc/environment"

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"