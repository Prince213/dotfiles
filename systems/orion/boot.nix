{ config, ... }:
{
  hardware.cpu.amd.updateMicrocode = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.broadcom_sta
  ];
}
