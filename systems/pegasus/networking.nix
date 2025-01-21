{ config, ... }:
{
  networking = {
    firewall.enable = false;

    networkmanager = {
      enable = true;
      ensureProfiles = {
        environmentFiles = [ config.sops.templates.networkmanager.path ];
        profiles = {
          ShanghaiTech-IoT = {
            connection = {
              id = "ShanghaiTech-IoT";
              uuid = "8eb2a392-c5b9-4083-9d9c-38c0d9027146";
              type = "wifi";
              autoconnect = true;
            };
            wifi.ssid = "ShanghaiTech-IoT";
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$PSK_ShanghaiTech_IoT";
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
  };
}
