{ lib, pkgs, ... }:
{
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader.systemd-boot = {
    enable = lib.mkDefault true;
    configurationLimit = 3;
  };
}
