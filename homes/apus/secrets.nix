{ config, ... }:
{
  sops = {
    secrets = {
      ssh-config = { };
      ssh-key-pegasus = { };
      ssh-key-nun = { };
      ssh-key-pavo = { };
      ssh-key-orion = { };
      ssh-key-corvus = { };
      ssh-key-epyc = { };
      ssh-key-andromeda = { };
      ssh-key-milky-way = { };
      ssh-key-github = { };
      ssh-key-sourcehut = { };
    };

    defaultSopsFile = ../../secrets.yaml;

    gnupg.home = config.programs.gpg.homedir;
  };
}
