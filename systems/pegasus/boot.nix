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
      users.root.shell = "/bin/systemd-tty-ask-password-agent";
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

    network.ssh = {
      enable = true;
      hostKeys = [
        config.sops.secrets.initrd-ssh-host-ed25519-key.path
      ];
    };

    secrets = {
      "/etc/wpa_supplicant/wpa_supplicant-wlan0.conf" = config.sops.secrets.wpa_supplicant.path;
    };
  };
}
