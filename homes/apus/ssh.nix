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
        identityFile = config.sops.secrets.pegasus-ssh-root-key.path;
        identitiesOnly = true;
      };
      nun = {
        host = "nun";
        user = "root";
        identityFile = config.sops.secrets.nun-ssh-root-key.path;
        identitiesOnly = true;
      };
      epyc1 = {
        host = "epyc1";
        user = "geekpie";
        identityFile = config.sops.secrets.epyc-ssh-geekpie-key.path;
        identitiesOnly = true;
      };
      epyc2 = {
        host = "epyc2";
        user = "geekpie";
        identityFile = config.sops.secrets.epyc-ssh-geekpie-key.path;
        identitiesOnly = true;
      };
      milky-way = {
        host = "milky-way";
        user = "geekpie";
        identityFile = config.sops.secrets.milky-way-ssh-geekpie-key.path;
        identitiesOnly = true;
      };
      github = {
        host = "github.com";
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identityFile = config.sops.secrets.github-ssh-git-key.path;
        identitiesOnly = true;
      };
      sourcehut = {
        host = "git.sr.ht";
        user = "git";
        identityFile = config.sops.secrets.sourcehut-ssh-git-key.path;
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
