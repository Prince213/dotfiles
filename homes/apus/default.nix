{ config, ... }:
{
  home.stateVersion = "24.11";

  home = {
    username = "prince213";
    homeDirectory = "/home/${config.home.username}";

    language.base = "zh_HK.UTF-8";
  };

  programs.home-manager.enable = true;

  imports = [
    ./chrome.nix
    ./direnv.nix
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./gpg.nix
    ./neovim.nix
    ./nix.nix
    ./packages.nix
    ./secrets.nix
    ./ssh.nix
    ./vscode.nix
    ./wezterm.nix
    ./zsh.nix
  ];
}
