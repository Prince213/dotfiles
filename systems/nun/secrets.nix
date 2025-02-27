{
  sops = {
    secrets = {
      root-password-hash = {
        neededForUsers = true;
      };
      network-eth0 = { };
    };

    defaultSopsFile = ./secrets.yaml;
  };
}
