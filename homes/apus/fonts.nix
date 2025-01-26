{ pkgs, packages, ... }:
{
  home.packages = with pkgs; [
    iosevka-bin
    packages.wubi98-fonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
    };
  };
}
