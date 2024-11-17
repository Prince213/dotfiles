{
  sops = {
    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = '''';
  };
}
