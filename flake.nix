{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixpkgs-zola-19 = {
      # Zola v0.19.2
      # See: https://www.nixhub.io/packages/zola
      url = "github:NixOS/nixpkgs/d98abf5cf5914e5e4e9d57205e3af55ca90ffc1d";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-zola-19,
      ...
    }:
    let
      supportedSystems = nixpkgs.lib.systems.flakeExposed;

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          function {
            pkgs = import nixpkgs {
              inherit system;

              overlays = [
                (final: previous: {
                  zola_19 = nixpkgs-zola-19.legacyPackages.${system}.zola;
                })
              ];
            };

            inherit system;
          }
        );

      installNixPackages = pkgs: [
        pkgs.busybox
        pkgs.git
        pkgs.go-task
        pkgs.rclone
        pkgs.zola_19

        pkgs.nix
        pkgs.nixd # Nix Language Server
        pkgs.nixfmt # Nix Formatter
      ];

      installNixFormatter = pkgs: pkgs.nixfmt-tree;
    in
    {
      formatter = forAllSystems ({ pkgs, ... }: installNixFormatter pkgs);

      devShells = forAllSystems (
        { pkgs, ... }:
        {
          default = pkgs.mkShellNoCC {
            packages = installNixPackages pkgs;
          };
        }
      );

      packages = forAllSystems (
        { pkgs, ... }:
        {
          default = pkgs.buildEnv {
            name = "profile";
            paths = installNixPackages pkgs;
          };
        }
      );
    };
}