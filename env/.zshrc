export PATH=$PATH:$HOME/Applications/google-cloud-sdk/bin

export EDITOR='nvim'
export ZSH_THEME="agnoster"
export NIXPKGS_ALLOW_INSECURE=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias c=clear
alias x='exit'
alias ll='eza -la'

alias hme='home-manager edit'
alias hms='home-manager switch && source $HOME/.zshrc'

# neovim
alias vn='cd $HOME/.config/home-manager/env/nvim/ && nvim init.lua'

# zsh
alias vz='nvim $HOME/.config/home-manager/env/.zshrc'

# yabai
alias vy='vim $HOME/.config/yabai'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
