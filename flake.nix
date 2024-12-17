{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      disko,
      sops-nix,
      home-manager,
      treefmt-nix,
      wezterm,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        flake = {
          nixosConfigurations = {
            pegasus = nixpkgs.lib.nixosSystem {
              modules = [
                ./systems/pegasus
                ./modules/system
                disko.nixosModules.disko
                sops-nix.nixosModules.sops
              ];
            };
            apus = nixpkgs.lib.nixosSystem {
              modules = [
                ./systems/apus
                ./modules/system
                disko.nixosModules.disko
                sops-nix.nixosModules.sops
              ];
            };
          };
          homeConfigurations."prince213@apus" = withSystem "x86_64-linux" (
            { pkgs, ... }:
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              extraSpecialArgs = {
                inherit wezterm;
              };

              modules = [
                ./homes/apus
                sops-nix.homeManagerModule
              ];
            }
          );
        };
        systems = [ "x86_64-linux" ];
        perSystem =
          { pkgs, ... }:
          {
            packages.wubi98-fonts = pkgs.callPackage ./pkgs/wubi98-fonts.nix { };

            devShells.default = pkgs.mkShellNoCC {
              packages = with pkgs; [
                sops
              ];
            };

            formatter =
              let
                treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
              in
              treefmtEval.config.build.wrapper;
          };
      }
    );
}
