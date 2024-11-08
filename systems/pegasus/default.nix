{
  system.stateVersion = "24.11";

  networking.hostName = "pegasus";
  nixpkgs.hostPlatform = "aarch64-linux";

  hardware.enableRedistributableFirmware = true;

  imports = [
    ./boot.nix
    ./disk.nix
    ./networking.nix
    ./secrets.nix
  ];
}
