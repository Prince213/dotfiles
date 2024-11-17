{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
  };
}
