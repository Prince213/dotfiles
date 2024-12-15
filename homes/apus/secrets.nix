{ config, ... }:
{
  sops = {
    secrets = {
      ssh-config = { };
      nun-ssh-root-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
