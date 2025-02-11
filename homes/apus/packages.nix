{ lib, pkgs, ... }:
{
  services = {
    kdeconnect.enable = true;
  };

  programs = {
    btop.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    go.enable = true;
    navi.enable = true;
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
    scrcpy
    telegram-desktop
    typst
  ];
}
