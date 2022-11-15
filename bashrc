
### User specific aliases and functions ###
# Some useful aliases - jesusrloza
    alias py='python3'
    alias nf='neofetch'
    alias vi='nvim'
    alias nv='nvim'
    alias ra='ranger'
    alias ll='ls -lh'
    alias cl='clear'
    alias q='exit'
    alias mkd='mkdir'
    alias webcam='mpv /dev/video0'
    alias notebook='jupyter notebook'
    alias lab='jupyter lab'
    alias jn='jupyter notebook'
    alias jl='jupyter lab'

# workflow aliases
    alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
    alias pull='git pull --recurse-submodules origin $(git rev-parse --abbrev-ref HEAD)'
    alias s="git status -s"
    alias c="git commit -m "
    alias a='git add . && git status -s'
    alias l='git log --oneline --all --graph --decorate'
    alias gb='git fetch && git checkout '
    alias undo='git checkout --'
    alias reset-h='git reset --hard HEAD~1'
    # alias reset='git reset --hard HEAD~1'
    alias clean='git clean -dnx'
    alias branch='git checkout -b'
    alias friday='pull && git commit -a -m "[WIP] Lastest changes from Friday" && push'
    alias changes='git diff --'
    alias nomerge='git merge --abort'
    
    alias dp='sudo docker ps'
    alias dcu='sudo docker-compose up'
    alias dcd='sudo docker-compose down'
    alias dcc='sudo docker-compose down -v --remove-orphans'
    # alias dcb='sudo docker-compose up --build -d'
    
    alias nr='npm run'
    alias nrs='npm run start'
    alias nrb='npm run build'
    alias npi='npm install'

# SSH Prep for personal and work repos
    eval `ssh-agent` &> /dev/null
    ssh-add ~/.ssh/jrl-gh-key &> /dev/null
    ssh-add ~/.ssh/parlevel-deployment-key &> /dev/null
    ssh-add ~/.ssh/github-linux-key &> /dev/null

# Show branch name if cwd is a git project
    parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

# Export personal variables
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\e[01;33m\]$(parse_git_branch)\[\033[00m\]\$ '
    export EDITOR=/usr/bin/nvim
    export SSH_PRIVATE_KEY=$(cat ~/.ssh/parlevel-deployment-key) &> /dev/null

# NVM setup
    # export NVM_DIR="$HOME/.nvm"
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion