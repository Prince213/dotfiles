{ config, ... }:
{
  hardware.cpu.amd.updateMicrocode = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.extraModulePackages = [
    config.boot.kernelPackages.broadcom_sta
  ];
}
