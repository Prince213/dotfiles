{
  sops = {
    secrets = {
      nun-ssh-root-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;
  };
}
