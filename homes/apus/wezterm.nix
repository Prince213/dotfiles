{ pkgs, wezterm, ... }:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.font = wezterm.font_with_fallback {
        'MonaspiceAr Nerd Font',
      }
      config.font_size = 11.0

      return config
    '';
  };
}
