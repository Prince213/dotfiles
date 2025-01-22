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
        networks."10-wlan0" = {
          matchConfig.Name = "wlan0";
          DHCP = "yes";
        };
      };
    };
  };
}
