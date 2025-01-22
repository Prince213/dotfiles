{ pkgs, ... }:
{
  boot.initrd = {
    availableKernelModules = [
      "brcmfmac"
      "brcmfmac_wcc"
    ];

    systemd = {
      enable = true;
      packages = [ pkgs.wpa_supplicant ];
      initrdBin = [ pkgs.wpa_supplicant ];
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
