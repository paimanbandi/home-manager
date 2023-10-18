export FLUTTER_HOME=$HOME/Applications/flutter
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export GCLOUD_HOME=$HOME/Applications/google-cloud-sdk
export GOPATH=$HOME/go
export DENO_INSTALL=$HOME/.deno
export PATH=$PATH:$FLUTTER_HOME/bin:$GCLOUD_HOME/bin:$JAVA_HOME/bin:$GOPATH/bin:$DENO_INSTALL/bin

export EDITOR='nvim'
export ZSH_THEME="agnoster"
export NIXPKGS_ALLOW_INSECURE=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias pp='cd $HOME/Projects/Personal'
alias gp='cd $HOME/Projects/Personal/golang'

alias c=clear
alias x='exit'
alias ll='eza -la'

alias hme='home-manager edit'
alias hms='home-manager switch && source $HOME/.zshrc'

# neovim
alias vn='cd $HOME/.config/home-manager/env/nvim/ && nvim init.lua'

# zsh
alias vz='nvim $HOME/.config/home-manager/env/.zshrc'
alias sz='source $HOME/.zshrc'

# yabai
alias vy='vim $HOME/.config/yabai'

# kubectl
#alias kubectl='HTTPS_PROXY=localhost:8888 kubectl'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
