{
  system.stateVersion = "24.11";

  networking.hostName = "pegasus";
  nixpkgs.hostPlatform = "aarch64-linux";

  imports = [
    ./disk.nix
    ./networking.nix
    ./packages.nix
    ./secrets.nix
    ./ssh.nix
    ./users.nix
  ];
}
