{ lib, pkgs, ... }:
{
  imports = [
    ./nix.nix
  ];

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader.systemd-boot = {
    enable = lib.mkDefault true;
    configurationLimit = 3;
  };

  services.tailscale.extraDaemonFlags = lib.mkDefault [
    "--no-logs-no-support"
  ];
}
