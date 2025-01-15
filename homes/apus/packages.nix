{ lib, pkgs, ... }:
{
  services.activitywatch.enable = true;

  programs.fastfetch.enable = true;

  programs.fd.enable = true;

  programs.go.enable = true;

  services.kdeconnect.enable = true;

  programs.nh.enable = true;

  programs.ripgrep.enable = true;

  programs.tmux.enable = true;

  home.packages = with pkgs; [
    awatcher
    clash-nyanpasu
    hmcl
    wl-clipboard
    localsend
    nixfmt-rfc-style
    obsidian
    telegram-desktop
    typst
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "code"
      "google-chrome"
      "obsidian"
      "vscode"
    ];
}
