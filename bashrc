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
    alias s="git status --short"
    alias a='git add . && git status --short'
    alias c="git commit -m "
    alias l='git log --all --graph --date=relative \
	    --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)"'

    alias branch='git checkout -b'
    alias changes='git diff --'
    alias clean='git clean -dnx'
    alias gb='git fetch && git checkout '
    alias nomerge='git merge --abort'
    alias undo='git checkout --'

    alias dynamo-local='cd ~/db/dynamo/dynamodb_local_latest ; java \
	    -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb'
    
    alias dp='sudo docker ps'
    alias dcu='sudo docker-compose up'
    alias dcd='sudo docker-compose down'
    
    alias nr='pnpm run'
    alias ni='pnpm install'

    alias cz-init='commitizen init cz-conventional-changelog --pnpm --save-dev --save-exact'
    alias ts-react-app='pnpx create-react-app "$1" --template typescript'

# Show branch name if cwd is a git project
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

# Export personal variables
    export SSH_PRIVATE_KEY=$(cat ~/.ssh/parlevel-deployment-key) &> /dev/null
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\e[01;33m\]$(parse_git_branch)\[\033[00m\]\$ '
    # export EDITOR=/usr/local/bin/nvim       # if built from source
    # export EDITOR=/usr/bin/nvim           # if apt installed

# SSH Prep for personal and work repos
    eval `ssh-agent` &> /dev/null
    ssh-add ~/.ssh/jrl-gh-key &> /dev/null
    ssh-add ~/.ssh/parlevel-deployment-key &> /dev/null
    ssh-add ~/.ssh/github-linux-key &> /dev/null
