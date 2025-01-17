{ config, ... }:
{
  sops = {
    secrets = {
      ssh-config = { };
      pegasus-ssh-root-key = { };
      nun-ssh-root-key = { };
      epyc-ssh-geekpie-key = { };
      milky-way-ssh-geekpie-key = { };
      github-ssh-git-key = { };
      sourcehut-ssh-git-key = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
