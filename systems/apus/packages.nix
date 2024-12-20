{ lib, ... }:
{
  hardware.bluetooth.enable = true;

  programs.steam.enable = true;

  services.tailscale.enable = true;

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];
}
