{ config, ... }:
{
  home.stateVersion = "24.11";

  home = {
    username = "prince213";
    homeDirectory = "/home/${config.home.username}";
  };

  programs.home-manager.enable = true;

  imports = [
    ./direnv.nix
    ./firefox.nix
    ./git.nix
    ./gpg.nix
    ./packages.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
