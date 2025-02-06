{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
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

    ghostty.url = "github:ghostty-org/ghostty";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      disko,
      lanzaboote,
      sops-nix,
      home-manager,
      treefmt-nix,
      nixvim,
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
            apus = withSystem "x86_64-linux" (
              { config, ... }:
              nixpkgs.lib.nixosSystem {
                specialArgs = {
                  inherit (config) packages;
                };

                modules = [
                  ./systems/apus
                  ./modules/system
                  disko.nixosModules.disko
                  lanzaboote.nixosModules.lanzaboote
                  sops-nix.nixosModules.sops
                ];
              }
            );
          };
          homeConfigurations."prince213@apus" = withSystem "x86_64-linux" (
            {
              config,
              inputs',
              pkgs,
              ...
            }:
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              extraSpecialArgs = {
                inherit (config) packages;
                inherit (inputs') ghostty;
                inherit (inputs') neovim-nightly;
              };

              modules = [
                ./homes/apus
                sops-nix.homeManagerModule
                nixvim.homeManagerModules.nixvim
              ];
            }
          );
        };
        systems = [ "x86_64-linux" ];
        perSystem =
          { pkgs, ... }:
          {
            packages = {
              wubi98-fonts = pkgs.callPackage ./pkgs/wubi98-fonts.nix { };
              mccgdi = pkgs.callPackage ./pkgs/mccgdi { };
              sing-box = pkgs.callPackage ./pkgs/sing-box.nix { };
            };

            devShells.default = pkgs.mkShellNoCC {
              packages = with pkgs; [
                just
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
