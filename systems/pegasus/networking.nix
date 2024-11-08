{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      profiles = {
        ShanghaiTech-IoT = {
          connection = {
            id = "ShanghaiTech-IoT";
          };
        };
      };
    };
  };
}
