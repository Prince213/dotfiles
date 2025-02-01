{ pkgs, ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.${pkgs.system}.default;
    settings = {
      font-family = "Iosevka Term SS08";
      theme = "xcodedarkhc";
    };
  };
}
