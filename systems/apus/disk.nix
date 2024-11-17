{
  disko.devices = {
    disk.main = {
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            priority = 1;
            type = "ef00";
            size = "1G";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          msr = {
            priority = 2;
            type = "0c01";
            size = "16M";
          };
          windows = {
            priority = 3;
            type = "0700";
            size = "192G";
          };
          data = {
            priority = 4;
            type = "0700";
            size = "64G";
          };
          root = {
            priority = 5;
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
