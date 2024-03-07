{ config, pkgs, lib, ... }:

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
    fish
    wget
    neovim
    neofetch
    tmux
    bat
    eza
    git
    fzf
    fd
    ripgrep
    jq
    yarn
    go
    deno
    cargo
    lazygit
  ];

  home.file = {
    ".config/nix".source = "${homeManagerPath}/nix";
    ".config/nixvim".source = "${homeManagerPath}/nixvim";
    ".config/nvim".source = "${homeManagerPath}/nvim";
    ".config/alacritty".source = "${homeManagerPath}/alacritty.yml";
    ".config/fish/config.fish".source = "${homeManagerPath}/config.fish";
    ".config/fish/bobthefish".source = "${homeManagerPath}/bobthefish";
    ".tmux.conf".source = "${homeManagerPath}/.tmux.conf";
  };

  manual.manpages.enable = false;
  programs.home-manager.enable = true;
  xdg.configFile."fish/conf.d/plugin-bobthefish.fish".text = lib.mkAfter ''
    for f in $plugin_dir/*.fish
      source $f
    end
    '';
  home.enableNixpkgsReleaseCheck = false;
}

