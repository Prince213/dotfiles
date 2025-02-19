{
  sops = {
    secrets = {
      root-password-hash = {
        neededForUsers = true;
      };
    };

    defaultSopsFile = ./secrets.yaml;
  };
}
