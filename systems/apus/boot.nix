{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.timeout = 0;

  boot.loader.systemd-boot.enable = false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
