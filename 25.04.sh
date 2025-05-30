#!/bin/bash

# temp download path
DOWNLOAD_PATH=$HOME/Downloads/tmp
mkdir -p $DOWNLOAD_PATH

# update upgrade
sudo apt-get update
sudo apt-get upgrade -yq

# set global theme to BreezeDark
lookandfeeltool --resetLayout -a org.kde.breezedark.desktop

# install flatpak, snap and some smaller apps (aria2 and git)
sudo apt-get install -yq flatpak snapd htop aria2 git plasma-discover-backend-flatpak plasma-discover-backend-snap
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# generate new ssh key
ssh-keygen -f $HOME/.ssh/id_rsa -N ""

# flatpak apps
flatpak install --noninteractive -y io.missioncenter.MissionCenter

# INSTALL: Chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $DOWNLOAD_PATH/chrome.deb
sudo apt-get-get install -yq $DOWNLOAD_PATH/chrome.deb

# fix flatpak theme
sudo flatpak install  --noninteractive -y org.gtk.Gtk3theme.Breeze-Dark
sudo flatpak override --env=GTK_THEME=Breeze-Dark