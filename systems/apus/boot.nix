{
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.cpu.intel.updateMicrocode = true;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
