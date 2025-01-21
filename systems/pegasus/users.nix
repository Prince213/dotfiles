{ config, ... }:
{
  users.users = {
    root = {
      hashedPasswordFile = config.sops.secrets.root-password-hash.path;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINy2ma4uvDu/xkKzqKcAFnEYlIQQpU90YXZUKfXYcWBE"
      ];
    };
  };
}
