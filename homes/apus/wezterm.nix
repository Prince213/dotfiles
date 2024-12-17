{ pkgs, wezterm, ... }:
{
  programs.wezterm = {
    enable = true;
    package = wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.hide_tab_bar_if_only_one_tab = true

      config.font = wezterm.font_with_fallback {
        'Iosevka',
        'Noto Sans Mono CJK SC',
      }
      config.font_size = 11.0

      return config
    '';
  };
}
