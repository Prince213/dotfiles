{ pkgs, ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.${pkgs.system}.default;
  };
}
