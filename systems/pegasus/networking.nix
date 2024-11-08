{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      profiles = {
        ShanghaiTech-IoT = { };
      };
    };
  };
}
