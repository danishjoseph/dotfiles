{ config, pkgs, ... }:
{
  home.username = "ubuntu";
  home.homeDirectory = "/home/ubuntu";

  home.packages = with pkgs; [
    gnumake
    git-crypt
  ];

  home.file.".bash_profile".text = ''
    if [ -x "$HOME/.nix-profile/bin/zsh" ]; then
        exec $HOME/.nix-profile/bin/zsh
    fi
  '';

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      documents = null;
      download = null;
      music = null;
      publicShare = null;
      templates = null;
      videos = null;
      pictures= null;
      extraConfig = {
        PERSONAL_DIR = "${config.home.homeDirectory}/Developer/Personal";
        WORK_DIR = "${config.home.homeDirectory}/Developer/Work";
      };
    };
  };

  programs.lazygit.enable = true;
  programs.git = import ./git.nix { inherit config pkgs; };
  programs.zsh = import ./zsh.nix { inherit config pkgs; };
  programs.tmux = import ./tmux.nix { inherit config pkgs; };
  programs.neovim = import ./neovim.nix { inherit config pkgs; };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship/starship.toml;
  };

  home.stateVersion = "25.11";
}
