{
  sops = {
    secrets = {
      network-eth0 = { };
    };

    defaultSopsFile = ./secrets.yaml;
  };
}
