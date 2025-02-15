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

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      disko,
      lanzaboote,
      sops-nix,
      home-manager,
      plasma-manager,
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
                ./common/system
                disko.nixosModules.disko
                sops-nix.nixosModules.sops
              ];
            };
            apus = withSystem "x86_64-linux" (
              { inputs', ... }:
              nixpkgs.lib.nixosSystem {
                modules = [
                  ./systems/apus
                  ./common/system
                  { nixpkgs.overlays = [ self.overlays.default ]; }
                  self.nixosModules.default

                  disko.nixosModules.disko
                  lanzaboote.nixosModules.lanzaboote
                  sops-nix.nixosModules.sops

                  home-manager.nixosModules.home-manager
                  {
                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      extraSpecialArgs = {
                        inherit (inputs') ghostty;
                        inherit (inputs') neovim-nightly;
                        inherit (inputs) vscode-extensions;
                      };
                      sharedModules = [
                        sops-nix.homeManagerModule
                        nixvim.homeManagerModules.nixvim
                        plasma-manager.homeManagerModules.plasma-manager
                      ];
                      users.prince213 = {
                        imports = [
                          ./homes/apus
                        ];
                      };
                    };
                  }
                ];
              }
            );
          };
          overlays.default = self: super: {
            firewalld = self.callPackage ./pkgs/firewalld { };
            wubi98-fonts = self.callPackage ./pkgs/wubi98-fonts.nix { };
            mccgdi = self.callPackage ./pkgs/mccgdi { };
            sing-box-beta = self.callPackage ./pkgs/sing-box-beta.nix { };
          };
          nixosModules.default = ./modules/system;
        };
        systems = [ "x86_64-linux" ];
        perSystem =
          { system, pkgs, ... }:
          {
            _module.args.pkgs = import nixpkgs {
              inherit system;
              overlays = [ self.overlays.default ];
            };

            packages = {
              inherit (pkgs) firewalld;
              inherit (pkgs) wubi98-fonts;
              inherit (pkgs) mccgdi;
              inherit (pkgs) sing-box-beta;
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
