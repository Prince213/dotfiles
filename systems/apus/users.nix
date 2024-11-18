{ pkgs, ... }:
{
  users.users.prince213 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
