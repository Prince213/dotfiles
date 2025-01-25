{ lib, ... }:
{
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;

  programs.kde-pim = {
    enable = true;
    merkuro = true;
  };

  services.power-profiles-daemon.enable = false;

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
