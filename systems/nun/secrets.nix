{
  sops = {
    secrets = {
      root-password-hash = {
        neededForUsers = true;
      };
      network-eth0 = {
        mode = "0444";
      };
    };

    defaultSopsFile = ./secrets.yaml;
  };
}
