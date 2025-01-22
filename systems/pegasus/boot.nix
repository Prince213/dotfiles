{
  boot.initrd = {
    systemd = {
      enable = true;
      network = {
        enable = true;
      };
    };
  };
}
