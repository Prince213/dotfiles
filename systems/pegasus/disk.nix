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
              mountOptions = [ "umask=0077" ];
            };
          };
          swap = {
            priority = 2;
            type = "8200";
            size = "1G";
            content = {
              type = "swap";
              randomEncryption = true;
            };
          };
          root = {
            priority = 3;
            type = "8305";
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
