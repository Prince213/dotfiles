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
            type = "wifi";
            autoconnect = true;
          };
          wifi.ssid = "SUSTech_5G";
          wifi-security = {
            key-mgmt = "wpa-psk";
          };
        };
      };
    };
  };
}
