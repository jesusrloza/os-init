#!/usr/bin/sh

# Docker on Ubuntu (https://docs.docker.com/engine/install/ubuntu/)
  read -p "Do you want to install docker? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "Installing docker..."

    # Uninstall old versions
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo nala remove --purge $pkg; done

    # Install required packages
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
