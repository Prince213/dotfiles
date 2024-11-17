{
  sops = {
    secrets = {
      psk-SUSTech_5G = { };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = '''';
  };
}
