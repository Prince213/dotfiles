{ config, ... }:
{
  home.stateVersion = "24.11";

  home = {
    username = "prince213";
    homeDirectory = "/home/${config.home.username}";
  };

  programs.home-manager.enable = true;

  imports = [
    ./activitywatch.nix
    ./chrome.nix
    ./direnv.nix
    ./firefox.nix
    ./fonts.nix
    ./ghostty.nix
    ./git.nix
    ./gpg.nix
    ./neovim.nix
    ./nix.nix
    ./packages.nix
    ./secrets.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
