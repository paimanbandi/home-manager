{ config, pkgs, ... }:

let 
  inherit (pkgs.stdenv) isLinux;
  homeDirectory = if isLinux then "home" else "Users";
  userHomeDirectory = "/${homeDirectory}/${config.home.username}";
  homeManagerPath = "/${userHomeDirectory}/.config/home-manager/env";
in
{
  home.username = "paiman";
  home.homeDirectory = userHomeDirectory;
  home.stateVersion = "23.05";

  home.packages = with pkgs;
  [
    zsh 
    fish
    starship
    neovim
    neofetch
    tmux
    bat
    eza
    git
    fzf
    ripgrep
    yarn
    go
    cargo
  ];

  home.file = {
    ".zshrc".source = "${homeManagerPath}/.zshrc";
    ".config/nvim".source = "${homeManagerPath}/nvim";
    ".config/alacritty".source = "${homeManagerPath}/alacritty.yml";
    ".wezterm.lua".source = "${homeManagerPath}/.wezterm.lua";
    ".config/starship.toml".source = "${homeManagerPath}/starship.toml";
    ".config/fish/config.fish".source = "${homeManagerPath}/config.fish";
  };

  programs.home-manager.enable = true;
}

