#!/usr/bin/sh

# installing nvm and latest node lts (https://github.com/nvm-sh/nvm)
  echo "installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  
  echo "installing latest nodejs lts..."
  nvm install --lts
  nvm use --lts
  nvm alias default lts/*

# install bun (https://bun.sh/)
  echo "installing bun..."
  curl -fsSL https://bun.sh/install | bash


# install pnpm (https://pnpm.io/)
  echo "installing pnpm..."
  npm install -g pnpm
  pnpm setup
  
  # pnpm add -g pnpm 
  # pnpm add -g tldr         # TLDR pages (https://github.com/tldr-pages/tldr)
  # pnpm add -g lite-server

