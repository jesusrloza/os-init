#!/usr/bin/sh

echo "installing code-insiders extensions..."
code-insiders --install-extension aaron-bond.better-comments
code-insiders --install-extension alexcvzz.vscode-sqlite
code-insiders --install-extension bierner.markdown-mermaid
code-insiders --install-extension bradlc.vscode-tailwindcss
code-insiders --install-extension christian-kohler.path-intellisense
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension dracula-theme.theme-dracula
code-insiders --install-extension dsznajder.es7-react-js-snippets
code-insiders --install-extension eamodio.gitlens
code-insiders --install-extension esbenp.prettier-vscode
code-insiders --install-extension GitHub.copilot
code-insiders --install-extension GitHub.copilot-chat
code-insiders --install-extension GitHub.github-vscode-theme
code-insiders --install-extension github.vscode-github-actions
code-insiders --install-extension GrapeCity.gc-excelviewer
code-insiders --install-extension johnpapa.vscode-peacock
code-insiders --install-extension moalamri.inline-fold
code-insiders --install-extension ms-azuretools.vscode-docker
code-insiders --install-extension ms-python.autopep8
code-insiders --install-extension ms-python.black-formatter
code-insiders --install-extension ms-python.isort
code-insiders --install-extension ms-python.python
code-insiders --install-extension ms-python.vscode-pylance
code-insiders --install-extension ms-vscode-remote.remote-containers
code-insiders --install-extension ms-vsliveshare.vsliveshare
code-insiders --install-extension oven.bun-vscode
code-insiders --install-extension PKief.material-icon-theme
code-insiders --install-extension rangav.vscode-thunder-client
code-insiders --install-extension streetsidesoftware.code-spell-checker
code-insiders --install-extension streetsidesoftware.code-spell-checker-spanish
code-insiders --install-extension svelte.svelte-vscode
code-insiders --install-extension tomoki1207.pdf
code-insiders --install-extension unifiedjs.vscode-mdx
code-insiders --install-extension usernamehw.errorlens
code-insiders --install-extension wix.glean
code-insiders --install-extension wmaurer.change-case
code-insiders --install-extension yummygum.city-lights-theme
code-insiders --install-extension zhuangtongfa.material-theme
code-insiders --install-extension ZixuanChen.vitest-explorer

echo "setting user configurations..."
mkdir -p ~/.config/Code\ -\ Insiders/User
cat ./config/code_settings.json > ~/.config/Code\ -\ Insiders/User/settings.json
cat ./config/code_keybindings.json > ~/.config/Code\ -\ Insiders/User/keybindings.json
