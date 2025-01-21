{ config, ... }:
{
  networking.firewall = {
    allowedTCPPortRanges = [
      # kdeconnect
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedTCPPorts = [
      # localsend
      53317
    ];
    allowedUDPPortRanges = [
      # kdeconnect
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [
      # localsend
      53317
    ];
  };

  networking.proxy.default = "http://127.0.0.1:7890";

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
        TP-LINK_CD28 = {
          connection = {
            id = "TP-LINK_CD28";
            uuid = "6117c42b-c3a4-4595-a286-2305f7d8bb02";
            type = "wifi";
            autoconnect = true;
          };
          wifi.ssid = "TP-LINK_CD28";
          wifi-security = {
            key-mgmt = "wpa-psk";
            psk = "$PSK_TP_LINK_CD28";
          };
        };
      };
    };
  };
}
