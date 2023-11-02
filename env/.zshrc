export FLUTTER_HOME=$HOME/Applications/flutter
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export GCLOUD_HOME=$HOME/Applications/google-cloud-sdk
export GOPATH=$HOME/go:$HOME/Projects/Personal/golang
export GOBIN=$HOME/go/bin
export DENO_INSTALL=$HOME/.deno
export MONGO_HOME=/usr/local/opt/mongodb-community@5.0
export PATH=$PATH:$FLUTTER_HOME/bin:$GCLOUD_HOME/bin:$JAVA_HOME/bin:$GOBIN:$DENO_INSTALL/bin:$MONGO_HOME/bin

export EDITOR='nvim'
export NIXPKGS_ALLOW_INSECURE=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias pp='cd $HOME/Projects/Personal'

# golang projects
alias gp='cd $HOME/Projects/Personal/golang/src'
alias ss='cd $HOME/Projects/Personal/golang/src/sharing-session'

alias c=clear
alias x='exit'
alias ll='eza -la'

# neovim
alias v='nvim'
alias vd='v .'
alias vc='cd $HOME/.config/home-manager/env/nvim/ && v init.lua'

# alacritty
alias va='v $HOME/.config/home-manager/env/alacritty/alacritty.yml'

# wezterm
alias vw='v $HOME/.config/home-manager/env/.wezterm.lua'

# starship
alias vs='v $HOME/.config/home-manager/env/starship.toml'

# zsh
alias vz='v $HOME/.config/home-manager/env/.zshrc'
alias sz='source $HOME/.zshrc'

# home-manager
alias hm='cd $HOME/.config/home-manager'
alias hme='home-manager edit'
alias hms='home-manager switch && sz && sudo chmod 777 $HOME/.config/nvim/lazy-lock.json'
alias vh='v $HOME/.config/home-manager/home.nix'

# yabai
alias vy='v $HOME/.config/yabai'

# kubectl
#alias kubectl='HTTPS_PROXY=localhost:8888 kubectl'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(starship init zsh)"
