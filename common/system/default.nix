{ lib, pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./ssh.nix
  ];

  time.timeZone = lib.mkDefault "Asia/Shanghai";

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot = {
      enable = lib.mkDefault true;
      configurationLimit = lib.mkDefault 3;
      editor = false;
    };
    grub = {
      configurationLimit = lib.mkDefault 3;
    };
  };

  services.tailscale.extraDaemonFlags = lib.mkDefault [
    "--no-logs-no-support"
  ];
}
