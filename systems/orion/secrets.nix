{
  sops = {
    secrets = {
      root-password-hash = {
        neededForUsers = true;
      };
      psk-SUSTech_5G = { };
    };

    defaultSopsFile = ./secrets.yaml;
  };
}
