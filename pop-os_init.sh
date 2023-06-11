#!/usr/bin/sh

# install nala package manager (https://gitlab.com/volian/nala)
  sudo apt update -y && sudo apt install nala

# Remove unnecesary software and update/upgrade
  sudo nala remove --purge totem seahorse -y
  sudo nala upgrade -y

# Append my bashrc configurations
  has_aliases='### User specific aliases and functions ###'
  if ! grep -q "$has_aliases" ~/.bashrc; then
    echo "Appending bashrc..."
    cat bashrc >> ~/.bashrc
  fi

# GNOME config
  sudo nala install gnome-tweaks dconf-editor -y
  sudo nala install yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound -y

# CLI programs
  sudo nala install git vim neofetch ranger htop curl tree p7zip-full p7zip-rar -y
  sudo nala install openssl qrencode poppler-utils -y
  sudo nala install python3 python3-pip sqlite3 jupyter -y

# AWS CLI and Java
  sudo nala install awscli openjdk-19-jre-headless -y

# Pip
  pip3 install -U pip notebook jupyterlab psutil openpyxl yt-dlp
  pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# GUI and quality of life programs
  sudo nala install keepassxc transmission meld remmina -y
  sudo nala install mpv celluloid gimp ffmpeg -y


# Installing NVM's latest nodejs lts (https://github.com/nvm-sh/nvm)
  if ! command -v nvm &> /dev/null
  then
    echo "nvm could not be found"
    echo "installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
    source ~/.bashrc

    echo "installing latest nodejs lts..."
    nvm install --lts
    nvm use --lts
    nvm alias default lts/*
  fi

# install pnpm (https://pnpm.io/)
  if ! command -v pnpm &> /dev/null
  then
    echo "pnpm could not be found"
    echo "installing pnpm..."
    npm install -g pnpm

    echo "configuring pnpm..."
    pnpm setup
    source ~/.bashrc
  fi

  pnpm add -g tldr          # TLDR pages (https://github.com/tldr-pages/tldr)
  pnpm add -g lite-server


# install code extensions only if code is already installed
if ! command -v code &> /dev/null
then
  echo "code could not be found"
else
  echo "installing code extensions..."
  code --install-extension aaron-bond.better-comments
  code --install-extension christian-kohler.path-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension docsmsft.docs-markdown
  code --install-extension docsmsft.docs-preview
  code --install-extension dracula-theme.theme-dracula
  code --install-extension dsznajder.es7-react-js-snippets
  code --install-extension eamodio.gitlens
  code --install-extension esbenp.prettier-vscode
  code --install-extension GitHub.copilot
  code --install-extension GitHub.github-vscode-theme
  code --install-extension GrapeCity.gc-excelviewer
  code --install-extension johnpapa.vscode-peacock
  code --install-extension mgmcdermott.vscode-language-babel
  code --install-extension mintlify.document
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension PKief.material-icon-theme
  code --install-extension ReacTreeDev.reactree
  code --install-extension redhat.vscode-yaml
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension streetsidesoftware.code-spell-checker-spanish
  code --install-extension tomoki1207.pdf
  code --install-extension usernamehw.errorlens
  code --install-extension wmaurer.change-case

  mkdir -p ~/.config/Code/User
  cat ./code_settings.json > ~/.config/Code/User/settings.json
  cat ./code_keybindings.json > ~/.config/Code/User/keybindings.json
fi

# Flatpak apps
  read -p "Do you want to install flatpak apps? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    flatpak install flathub com.brave.Browser           # Brave Browser
    flatpak install flathub nl.hjdskes.gcolor3          # Color Picker
    flatpak install flathub org.gaphor.Gaphor           # Gaphor
    flatpak install flathub com.github.phase1geo.minder # Minder
    flatpak install flathub org.signal.Signal           # Signal
    flatpak install flathub us.zoom.Zoom                # Zoom
  fi

# Add multiverse repository 
  if ! grep -q "multiverse" /etc/apt/sources.list; then
      echo "Adding multiverse repository..."
      sudo add-apt-repository multiverse
      sudo nala update -y
  fi

# Fonts
  sudo nala install fonts-crosextra-carlito -y 
  # sudo nala install ttf-mscorefonts-installer -y 

# Docker on Ubuntu (https://docs.docker.com/engine/install/ubuntu/)
  read -p "Do you want to install docker? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "Installing docker..."

    # Uninstall old versions
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo nala remove --purge $pkg; done

    # Set up the repository
    sudo nala update -y
    sudo nala install ca-certificates curl gnupg -y

    # Add Docker’s official GPG key:
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add Docker apt repository.
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Install Docker Engine
    sudo nala update -y
    sudo nala install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo docker run hello-world
  fi

echo "Please reboot your system"
