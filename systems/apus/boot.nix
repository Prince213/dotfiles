{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader.systemd-boot.configurationLimit = 3;
}
