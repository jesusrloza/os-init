#!/usr/bin/sh

# update/upgrade
  sudo apt update -y && sudo apt upgrade -y

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
  sudo nala remove nano -y

# Python and Pip
  sudo nala install python3 python3-pip sqlite3 jupyter -y
  pip3 install -U pip notebook jupyterlab psutil openpyxl yt-dlp
  pip3 install -U numpy pandas scikit-learn matplotlib seaborn nltk beautifulsoup4

# Jupyter notebook config modification to fix behaviour on windows
  jupyter notebook --generate-config
  old_jn="#c.NotebookApp.use_redirect_file = True"
  new_jn="c.NotebookApp.use_redirect_file = False"
  sed -i "s/$old_jn/$old_jn\n$new_jn/g" /home/$USER/.jupyter/jupyter_notebook_config.py

