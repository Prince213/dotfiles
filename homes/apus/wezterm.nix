{ pkgs, wezterm, ... }:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      return config
    '';
  };
}
