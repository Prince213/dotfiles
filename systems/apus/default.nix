{
  system.stateVersion = "24.11";

  networking.hostName = "apus";
  nixpkgs.hostPlatform = "x86_64-linux";

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  imports = [
    ./boot.nix
    ./dae.nix
    ./desktop.nix
    ./disk.nix
    ./firewall.nix
    ./i18n.nix
    ./keyd.nix
    ./networking.nix
    ./packages.nix
    ./podman.nix
    ./printing.nix
    ./secrets.nix
    ./sing-box.nix
    ./ssh.nix
    ./users.nix
  ];
}
