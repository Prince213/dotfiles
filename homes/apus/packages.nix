{ lib, pkgs, ... }:
{
  programs.fastfetch.enable = true;

  programs.nh.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "code"
      "vscode"
    ];
}
