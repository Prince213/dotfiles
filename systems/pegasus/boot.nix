{ config, pkgs, ... }:
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
      targets.initrd.wants = [ "wpa_supplicant@wlan0.service" ];
      services."wpa_supplicant@".unitConfig.DefaultDependencies = false;
    };

    secrets = {
      "/etc/wpa_supplicant/wpa_supplicant-wlan0.conf" = config.sops.secrets.wpa_supplicant.path;
    };
  };
}
