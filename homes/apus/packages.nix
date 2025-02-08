{ lib, pkgs, ... }:
{
  services = {
    activitywatch = {
      enable = true;
      package = pkgs.aw-server-rust;
      watchers = {
        awatcher = {
          package = pkgs.awatcher;
        };
      };
    };
    kdeconnect.enable = true;
  };

  programs = {
    btop.enable = true;
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
