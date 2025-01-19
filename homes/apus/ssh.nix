{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "1h";
    includes = [ config.sops.secrets.ssh-config.path ];
    matchBlocks = {
      pegasus = {
        host = "pegasus";
        user = "root";
        identityFile = config.sops.secrets.ssh-key-pegasus.path;
        identitiesOnly = true;
      };
      nun = {
        host = "nun";
        user = "root";
        identityFile = config.sops.secrets.ssh-key-nun.path;
        identitiesOnly = true;
      };
      pavo = {
        host = "pavo";
        identityFile = config.sops.secrets.ssh-key-pavo.path;
        identitiesOnly = true;
      };
      corvus = {
        host = "corvus";
        user = "root";
        identityFile = config.sops.secrets.ssh-key-corvus.path;
        identitiesOnly = true;
      };
      epyc1 = {
        host = "epyc1";
        user = "geekpie";
        identityFile = config.sops.secrets.ssh-key-epyc.path;
        identitiesOnly = true;
      };
      epyc2 = {
        host = "epyc2";
        user = "geekpie";
        identityFile = config.sops.secrets.ssh-key-epyc.path;
        identitiesOnly = true;
      };
      andromeda = {
        host = "andromeda";
        user = "geekpie";
        identityFile = config.sops.secrets.ssh-key-andromeda.path;
        identitiesOnly = true;
      };
      milky-way = {
        host = "milky-way";
        user = "geekpie";
        identityFile = config.sops.secrets.ssh-key-milky-way.path;
        identitiesOnly = true;
      };
      github = {
        host = "github.com";
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identityFile = config.sops.secrets.ssh-key-github.path;
        identitiesOnly = true;
      };
      sourcehut = {
        host = "git.sr.ht";
        user = "git";
        identityFile = config.sops.secrets.ssh-key-sourcehut.path;
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
