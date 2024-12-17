{ pkgs, ... }:
{
  home.packages = with pkgs; [
    iosevka
    nerd-fonts.monaspace
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
    };
  };
}
