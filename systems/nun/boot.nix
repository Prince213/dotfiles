{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    systemd-boot.enable = false;
    grub.enable = true;
  };
}
