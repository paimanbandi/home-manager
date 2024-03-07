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
    # zsh 
    fish
    wget
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
    lazygit
  ];

  home.file = {
    ".config/nix".source = "${homeManagerPath}/nix";
    # ".zshrc".source = "${homeManagerPath}/.zshrc";
    ".config/nixvim".source = "${homeManagerPath}/nixvim";
    ".config/nvim".source = "${homeManagerPath}/nvim";
    ".config/alacritty".source = "${homeManagerPath}/alacritty.yml";
    ".wezterm.lua".source = "${homeManagerPath}/.wezterm.lua";
    ".config/starship.toml".source = "${homeManagerPath}/starship.toml";
    ".config/fish/config.fish".source = "${homeManagerPath}/config.fish";
    ".tmux.conf".source = "${homeManagerPath}/.tmux.conf";
  };

  manual.manpages.enable = false;
  programs.home-manager.enable = true;
}

