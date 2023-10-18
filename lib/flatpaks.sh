#!/usr/bin/sh

# Flatpak apps
  read -p "Do you want to install flatpak apps? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    flatpak install flathub com.brave.Browser               # Brave Browser
    flatpak install flathub com.github.debauchee.barrier    # Barrier
    flatpak install flathub dev.geopjr.Collision            # Collision
    flatpak install flathub io.gitlab.gregorni.Letterpress  # Letterpress
    flatpak install flathub org.signal.Signal               # Signal
    flatpak install flathub us.zoom.Zoom                    # Zoom
  fi