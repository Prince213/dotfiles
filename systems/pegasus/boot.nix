{
  boot.initrd = {
    availableKernelModules = [
      "brcmfmac"
      "brcmfmac_wcc"
    ];

    systemd = {
      enable = true;
      network = {
        enable = true;
      };
    };
  };
}
