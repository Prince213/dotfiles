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
          };
        };
      };
    };
  };
}
