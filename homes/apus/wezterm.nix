{ pkgs, wezterm, ... }:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
  };
}
