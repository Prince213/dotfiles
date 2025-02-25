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
    zoxide.enable = true;
  };

  home.packages = with pkgs; [
    awatcher
    bitwarden-desktop
    clang-tools
    flclash
    cinny-desktop
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
