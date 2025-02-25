{ config, ... }:
{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [ config.sops.templates.networkmanager.path ];
      profiles = {
        SUSTech_5G = {
          connection = {
            id = "SUSTech_5G";
            uuid = "1d3acb48-0d12-425f-a5f7-108b0d5049b4";
            type = "wifi";
            autoconnect = true;
          };
          wifi.ssid = "SUSTech_5G";
          wifi-security = {
            key-mgmt = "wpa-psk";
            psk = "$PSK_SUSTech_5G";
          };
        };
      };
    };
  };
}
