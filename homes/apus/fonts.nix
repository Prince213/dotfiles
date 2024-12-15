{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.monaspace
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  fonts.fontconfig = {
    enable = true;
  };
}
