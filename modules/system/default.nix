{ lib, pkgs, ... }:
{
  imports = [
    ./nix.nix
  ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader.systemd-boot = {
    enable = lib.mkDefault true;
    configurationLimit = lib.mkDefault 3;
  };

  services.openssh.enable = lib.mkDefault true;

  services.tailscale.extraDaemonFlags = lib.mkDefault [
    "--no-logs-no-support"
  ];
}
