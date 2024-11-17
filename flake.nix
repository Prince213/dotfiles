{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      disko,
      sops-nix,
      ...
    }:
    {
      nixosConfigurations = {
        pegasus = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/pegasus
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
          ];
        };
        apus = nixpkgs.lib.nixosSystem {
          modules = [
            ./systems/apus
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
