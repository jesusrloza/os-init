#!/usr/bin/sh

# install nala package manager (https://gitlab.com/volian/nala)
  sudo apt update -y && sudo apt install nala

# Remove unnecesary software and update/upgrade
  sudo nala remove --purge totem seahorse -y
  sudo nala upgrade -y

# Append my bashrc configurations
  cat ./bashrc >> ~/.bashrc

# GNOME config
  sudo nala install gnome-tweaks dconf-editor -y

# CLI programs
  sudo nala install git vim neofetch ranger htop curl tree p7zip-full p7zip-rar -y
  sudo nala install openssl qrencode poppler-utils -y
  sudo nala install awscli openjdk-19-jre-headless -y
  sudo nala install python3 python3-pip sqlite3 jupyter -y

# Pip
  pip3 install -U pip notebook jupyterlab psutil openpyxl youtube-dl
  pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# GUI and quality of life programs
  sudo nala install timeshift keepassxc transmission meld remmina -y
  sudo nala install mpv celluloid gimp ffmpeg youtube-dl -y
  sudo nala install yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound -y


# Installing NVM's latest nodejs lts (https://github.com/nvm-sh/nvm)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  source ~/.bashrc
  nvm install --lts
  nvm alias default lts/*

# pnpm setup and global programs
  npm i -g pnpm
  pnpm setup
  source ~/.bashrc

  pnpm add -g tldr          # TLDR pages (https://github.com/tldr-pages/tldr)
  pnpm add -g lite-server

# vs code config
  code --install-extension aaron-bond.better-comments
  code --install-extension christian-kohler.path-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension dracula-theme.theme-dracula
  code --install-extension eamodio.gitlens
  code --install-extension esbenp.prettier-vscode
  code --install-extension GitHub.github-vscode-theme
  code --install-extension GrapeCity.gc-excelviewer
  code --install-extension johnpapa.vscode-peacock
  code --install-extension mintlify.document
  code --install-extension ms-edgedevtools.vscode-edge-devtools
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension PKief.material-icon-theme
  code --install-extension redhat.vscode-yaml
  code --install-extension tomoki1207.pdf
  code --install-extension wmaurer.change-case

  mkdir -p ~/.config/Code/User
  cat ./code_settings.json > ~/.config/Code/User/settings.json
  cat ./code_keybindings.json > ~/.config/Code/User/keybindings.json


# Flatpak
  flatpak install flathub nl.hjdskes.gcolor3          # Color Picker
  flatpak install flathub com.github.tenderowl.frog   # Frog
  flatpak install flathub com.github.phase1geo.minder # Minder
  flatpak install flathub org.signal.Signal           # Signal
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
