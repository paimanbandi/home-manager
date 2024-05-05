source $HOME/.config/fish/bobthefish/__bobthefish_colors.fish
source $HOME/.config/fish/bobthefish/__bobthefish_display_colors.fish
source $HOME/.config/fish/bobthefish/__bobthefish_glyphs.fish
source $HOME/.config/fish/bobthefish/bobthefish_display_colors.fish
source $HOME/.config/fish/bobthefish/fish_greeting.fish
source $HOME/.config/fish/bobthefish/fish_mode_prompt.fish
source $HOME/.config/fish/bobthefish/fish_prompt.fish
source $HOME/.config/fish/bobthefish/fish_right_prompt.fish
source $HOME/.config/fish/bobthefish/fish_title.fish

set -g theme_display_git yes
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_docker_machine no
set -g theme_display_hg yes
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Asia/Jakarta
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '\033[0;35m><(((º>\033[0m'

export FLUTTER_HOME=$HOME/Applications/flutter
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export GCLOUD_HOME=$HOME/Applications/google-cloud-sdk
export GOPATH=$HOME/Projects/Personal/golang
export GOBIN=$HOME/go/bin
export DENO_INSTALL=$HOME/.deno
export MONGO_HOME=/usr/local/opt/mongodb-community@5.0
# export PATH=$PATH:$FLUTTER_HOME/bin:$GCLOUD_HOME/bin:$JAVA_HOME/bin:$GOBIN:$DENO_INSTALL/bin:$MONGO_HOME/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin

set -gx PATH $PATH $FLUTTER_HOME/bin $GCLOUD_HOME/bin $JAVA_HOME/bin $GOBIN $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $HOME/.local/bin

export EDITOR='nvim'
export NIXPKGS_ALLOW_INSECURE=1

export TERM=screen-256color

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

set -gx PATH /usr/local/bin /usr/bin /bin $PATH

alias pc='cd $HOME/Projects/Creds'
alias cda='cd $HOME/Projects/Creds/creds-dashboard-api'
alias cdw='cd $HOME/Projects/Creds/creds-dashboard-web'
alias cpa='cd $HOME/Projects/Creds/creds-platform-api'
alias cpw='cd $HOME/Projects/Creds/creds-platform-web'

# replix
alias pr='cd $HOME/Projects/Replix'
alias prp='cd $HOME/Projects/Replix/project'

alias pp='cd $HOME/Projects/Personal'

# golang projects
alias gp='cd $HOME/Projects/Personal/golang/src'
alias gps='cd $HOME/Projects/Personal/golang/src/sharing-session'
alias fp='cd $HOME/Projects/Personal/flutter'
alias fps='cd $HOME/Projects/Personal/flutter/sharing-session'

alias c=clear
alias x='exit'
alias ll='eza -la'

alias python=python3

# neovim
#alias nvim='$HOME/.config/nixvim/result/bin/nvim'
#alias nvim='/Users/paiman/Applications/nvim-macos/bin/nvim'
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
# alias vz='v $HOME/.config/home-manager/env/.zshrc'
# alias sz='source $HOME/.zshrc'

# fish 
alias vf='v $HOME/.config/home-manager/env/config.fish'
alias sf='source $HOME/.config/fish/config.fish'

# tmux
alias vt='v $HOME/.config/home-manager/env/.tmux.conf'

# home-manager
alias hm='cd $HOME/.config/home-manager'
alias hme='hm && home-manager edit'
#alias hms='cd $HOME/.config/home-manager/env/nixvim/ && nix build --extra-experimental-features "flakes nix-command" && home-manager switch && sf'

alias hms='home-manager switch && sudo chmod 777 $HOME/.config/nvim/lazy-lock.json && sf'
alias vh='v $HOME/.config/home-manager/home.nix'

# yabai
alias vy='v $HOME/.config/yabai'

# kubectl
alias kubectl='HTTPS_PROXY=localhost:8888 kubectl'

set -gx NVM_DIR (if set -q XDG_CONFIG_HOME; echo $XDG_CONFIG_HOME/nvm; else; echo $HOME/.nvm; end)

if status is-interactive
  printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end
