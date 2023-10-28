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
    neovim
    neofetch
    bat
    eza
    git
    fzf
    ripgrep
    yarn
    go
  ];

  home.file = {
    ".zshrc".source = "${homeManagerPath}/.zshrc";
    ".config/nvim".source = "${homeManagerPath}/nvim";
  };

  programs.home-manager.enable = true;
}

