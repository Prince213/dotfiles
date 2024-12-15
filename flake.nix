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
    {
      nixpkgs,
      disko,
      sops-nix,
      home-manager,
      treefmt-nix,
      wezterm,
      ...
    }:
    (
      {
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

        homeConfigurations = {
          "prince213@apus" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;

            extraSpecialArgs = {
              inherit wezterm;
            };

            modules = [
              ./homes/apus
              sops-nix.homeManagerModule
            ];
          };
        };

      }
      // (
        let
          system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${system};
          treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        {
          devShells.${system}.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              sops
            ];
          };

          formatter.${system} = treefmtEval.config.build.wrapper;
        }
      )
    );
}
