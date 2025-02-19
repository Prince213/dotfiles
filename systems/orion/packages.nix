{ lib, ... }:
{
  hardware.enableRedistributableFirmware = true;

  services.tailscale.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];
}
