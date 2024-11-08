{
  system.stateVersion = "24.11";

  networking.hostName = "pegasus";
  nixpkgs.hostPlatform = "aarch64-linux";

  imports = [
    ./boot.nix
    ./disk.nix
  ];
}
