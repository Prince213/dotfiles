{ lib, pkgs, ... }:
{
  programs.fastfetch.enable = true;

  programs.fd.enable = true;

  programs.go.enable = true;

  programs.nh.enable = true;

  programs.ripgrep.enable = true;

  programs.tmux.enable = true;

  home.packages = with pkgs; [
    clash-nyanpasu
    hmcl
    wl-clipboard
    localsend
    telegram-desktop
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "code"
      "google-chrome"
      "vscode"
    ];
}
