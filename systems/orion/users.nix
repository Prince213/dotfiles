{ config, ... }:
{
  users.users = {
    root = {
      hashedPasswordFile = config.sops.secrets.root-password-hash.path;
    };
  };
}
