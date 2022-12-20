#!/usr/bin/sh

# install nala package manager (https://gitlab.com/volian/nala)
sudo apt update -y && sudo apt install nala

# Remove unnecesary software and update/upgrade
sudo nala remove --purge shotwell rhythmbox totem thunderbird gnome-todo deja-dup seahorse -y
sudo nala upgrade -y

# Append my bashrc configurations
cat ./bashrc >> ~/.bashrc
source ~/.bashrc

# GNOME config
sudo nala install gnome-shell-extension-prefs gnome-tweaks dconf-editor -y

# CLI programs
sudo nala install git neovim neofetch ranger htop curl tree p7zip-full p7zip-rar -y
sudo nala install openssl qrencode poppler-utils -y
sudo nala install python3 python3-pip sqlite3 jupyter -y

# Pip
pip3 install -U pip notebook jupyterlab psutil openpyxl youtube-dl
pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# GUI and quality of life programs
sudo nala install timeshift keepassxc transmission meld remmina -y
sudo nala install mpv celluloid gimp ffmpeg youtube-dl -y

# Installing NVM's latest nodejs lts (https://github.com/nvm-sh/nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm alias default lts/*

# TLDR pages (https://github.com/tldr-pages/tldr)
npm i -g tldr

# Snaps
sudo snap install brave
sudo snap install code --classic
sudo snap install cpufetch
sudo snap install discord
sudo snap install emote
sudo snap install postman
sudo snap install signal-desktop
sudo snap install telegram-desktop

# Flatpak
sudo nala install flatpak
  # sudo nala install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 
flatpak install flathub com.github.phase1geo.minder # Minder
flatpak install flathub com.github.tenderowl.frog   # Frog
flatpak install flathub nl.hjdskes.gcolor3          # Color Picker
flatpak install flathub us.zoom.Zoom                # Zoom

# Fonts
sudo add-apt-repository multiverse
sudo nala update -y && sudo nala install fonts-crosextra-carlito -y 
  # ttf-mscorefonts-installer

# Docker on Ubuntu (https://docs.docker.com/engine/install/ubuntu/)
## Uninstall old versions
sudo nala remove --purge docker docker-engine docker.io containerd runc -y

## Set up the repository
### Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo nala update -y
sudo nala install ca-certificates curl gnupg lsb-release -y
### Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
### Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## Install Docker Engine
sudo nala update -y
sudo nala install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


echo "Please reboot your system"