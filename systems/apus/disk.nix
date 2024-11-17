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
          };
        };
      };
    };
  };
}
