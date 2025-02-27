{
  disko.devices = {
    disk.main = {
      device = "/dev/vda";
      imageSize = "10G";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            priority = 1;
            type = "ef02";
            size = "1M";
          };
          root = {
            priority = 2;
            type = "8304";
            size = "100%";
            content = {
              type = "btrfs";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
