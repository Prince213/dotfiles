{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.enable = false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
