{ lib, pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    fastfetch
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];
}
