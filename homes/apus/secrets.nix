{ config, ... }:
{
  sops = {
    secrets = {
      ssh-config = { };
      nun-ssh-root-key = { };
      sourcehut-ssh-git-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
