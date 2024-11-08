{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      profiles = {
        ShanghaiTech-IoT = {
          connection = {
            id = "ShanghaiTech-IoT";
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
