{ lib, pkgs, ... }:
{
  services = {
    activitywatch.enable = true;
    kdeconnect.enable = true;
  };

  programs = {
    fastfetch.enable = true;
    fd.enable = true;
    go.enable = true;
    nh.enable = true;
    ripgrep.enable = true;
    tmux.enable = true;
    zoxide.enable = true;
  };

  home.packages = with pkgs; [
    awatcher
    clang-tools
    flclash
    hmcl
    wl-clipboard
    localsend
    nixd
    nixfmt-rfc-style
    obsidian
    scrcpy
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
