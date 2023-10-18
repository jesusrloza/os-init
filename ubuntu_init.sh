#!/usr/bin/sh

# Install nala package manager (https://gitlab.com/volian/nala)
  if ! command -v nala &> /dev/null
  then
    echo "nala could not be found"
    echo "installing nala..."

    sudo apt update -y && sudo apt install nala -y
    
    # Remove unnecesary software and update/upgrade
      sudo nala remove --purge shotwell rhythmbox totem thunderbird gnome-todo deja-dup seahorse -y
      sudo nala upgrade -y
  fi

# Append my bashrc configurations
  has_aliases='### User specific aliases and functions ###'
  if ! grep -q "$has_aliases" ~/.bashrc; then
    echo "Appending bashrc..."
    cat ./config/bashrc >> ~/.bashrc
  fi

# CLI programs
  sudo nala install git curl openssl htop tree -y
  sudo nala install neovim neofetch ranger p7zip-full p7zip-rar -y
  # sudo nala install qrencode poppler-utils -y

# Productivity and multimedia
  sudo nala install keepassxc transmission meld -y
  sudo nala install mpv celluloid gimp ffmpeg -y

# GNOME config
  sudo nala install gnome-tweaks dconf-editor gnome-shell-extension-prefs -y

# Python and Pip
  sudo nala install python3 python3-pip sqlite3 jupyter -y
  pip3 install -U pip notebook jupyterlab psutil openpyxl yt-dlp
  pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# Snaps
  # sudo snap install code --classic
  # sudo snap install aws-cli --classic
  # sudo snap install emote
  # sudo snap install postman
  # sudo snap install signal-desktop

# Add multiverse repository 
  if ! grep -q "multiverse" /etc/apt/sources.list; then
      echo "Adding multiverse repository..."
      sudo add-apt-repository multiverse
      sudo nala update -y
  fi

# Fonts
  sudo nala install fonts-crosextra-carlito -y 
  # sudo nala install ttf-mscorefonts-installer -y 
