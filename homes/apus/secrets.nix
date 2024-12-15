{ config, ... }:
{
  sops = {
    secrets = {
      ssh-config = { };
      nun-ssh-root-key = { };
      github-ssh-git-key = { };
      sourcehut-ssh-git-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
