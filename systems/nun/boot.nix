{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    systemd-boot.enable = false;
    grub.enable = true;
  };

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "virtio_pci"
    "virtio_scsi"
    "virtio_blk"
  ];
}
