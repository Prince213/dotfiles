{
  system.stateVersion = "24.11";

  networking.hostName = "nun";
  nixpkgs.hostPlatform = "x86_64-linux";

  imports = [
    ./boot.nix
    ./disk.nix
    ./networking.nix
    ./packages.nix
    ./secrets.nix
    ./ssh.nix
    ./users.nix
  ];
}
