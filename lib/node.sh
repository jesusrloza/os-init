#!/usr/bin/sh

# installing nvm and latest node lts (https://github.com/nvm-sh/nvm)
  if ! command -v nvm &> /dev/null
  then
    echo "nvm could not be found"
    echo "installing nvm..."

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
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

    pnpm add -g tldr         # TLDR pages (https://github.com/tldr-pages/tldr)
    pnpm add -g lite-server
  fi

# install bun (https://bun.sh/)
if ! command -v bun &> /dev/null
then
  echo "bun could not be found"
  echo "installing bun..."
  curl -fsSL https://bun.sh/install | bash
fi