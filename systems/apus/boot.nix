{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 3;
  };
}
