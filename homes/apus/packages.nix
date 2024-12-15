{ lib, pkgs, ... }:
{
  programs.fastfetch.enable = true;

  programs.nh.enable = true;

  programs.ripgrep.enable = true;

  home.packages = with pkgs; [
    clash-nyanpasu
    localsend
    telegram-desktop
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "code"
      "vscode"
    ];
}
