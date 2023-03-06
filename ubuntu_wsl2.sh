#!/usr/bin/sh

# update/upgrade
  sudo apt update -y && sudo apt upgrade -y

# Append my bashrc configurations
  cat ./bashrc >> ~/.bashrc
  source ~/.bashrc

# CLI programs
  sudo apt-get install git neovim neofetch ranger htop curl tree -y
  sudo apt-get install openssl qrencode poppler-utils -y
  sudo apt-get install python3 python3-pip sqlite3 jupyter -y
  sudo apt-get remove nano -y

# Pip
  pip3 install -U pip notebook jupyterlab psutil openpyxl youtube-dl
  pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# Installing NVM's latest nodejs lts (https://github.com/nvm-sh/nvm)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  source ~/.bashrc
  nvm install --lts
  nvm alias default lts/*

# pnpm setup and global programs
  pnpm setup
  source ~/.bashrc

  pnpm add -g tldr          # TLDR pages (https://github.com/tldr-pages/tldr)
  pnpm add -g lite-server

# Jupyter notebook config modification to fix behaviour on windows
  jupyter notebook --generate-config
  old_jn="#c.NotebookApp.use_redirect_file = True"
  new_jn="c.NotebookApp.use_redirect_file = False"
  sed -i "s/$old_jn/$old_jn\n$new_jn/g" /home/$USER/.jupyter/jupyter_notebook_config.py

