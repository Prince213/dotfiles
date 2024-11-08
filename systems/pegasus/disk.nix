{
  disko.devices = {
    disk.main = {
      device = "/dev/mmcblk0";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            priority = 1;
            type = "ef00";
            size = "512M";
          };
        };
      };
    };
  };
}
