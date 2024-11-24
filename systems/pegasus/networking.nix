{ config, ... }:
{
  networking.networkmanager = {
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
      };
    };
  };
}
