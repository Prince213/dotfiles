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
