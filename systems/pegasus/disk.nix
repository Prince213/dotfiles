{
  disko.devices = {
    disk.main = {
      device = "/dev/mmcblk0";
      content = {
        type = "gpt";
        efiGptPartitionFirst = false;
        partitions = {
          boot = {
            priority = 1;
            type = "ef00";
            size = "512M";
            hybrid.mbrPartitionType = "0c";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
        };
      };
    };
  };
}
