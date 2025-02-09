{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS08"; })
    wubi98-fonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
    };
  };
}
