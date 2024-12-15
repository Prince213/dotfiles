{ config, ... }:
{
  sops = {
    secrets = {
      nun-ssh-root-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
