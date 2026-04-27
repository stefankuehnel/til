{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs = {
      url = "https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz";
    };

    nixpkgs-zola-19 = {
      # Zola v0.19.2
      # Pinned because Zola 0.20+ introduced breaking changes.
      # Reference: https://www.nixhub.io/packages/zola
      #
      # To find the exact URL for the nixexprs.tar.xz file, you can use the AWS CLI S3 API as follows:
      # nix shell nixpkgs#awscli2 -c aws s3api list-objects-v2 \
      #   --bucket nix-releases \
      #   --no-sign-request \
      #   --prefix "nixpkgs/" \
      #   --query "Contents[?ends_with(Key, 'd98abf5cf591/nixexprs.tar.xz')].Key" \
      #   --output text
      url = "https://releases.nixos.org/nixpkgs/nixpkgs-25.05pre750212.d98abf5cf591/nixexprs.tar.xz";
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

      dependencies = pkgs: [
        pkgs.go-task
        pkgs.rclone
        pkgs.zola_19
      ];

      devDependencies = pkgs: [
        pkgs.opencode

        pkgs.nix
        pkgs.nixd
        pkgs.nixfmt
      ];

      fmtDependencies = pkgs: pkgs.nixfmt-tree;
    in
    {
      formatter = forAllSystems ({ pkgs, ... }: fmtDependencies pkgs);

      devShells = forAllSystems (
        { pkgs, ... }:
        {
          ciEnvironment = pkgs.mkShellNoCC {
            packages = dependencies pkgs;
          };

          devEnvironment = pkgs.mkShellNoCC {
            packages = (dependencies pkgs) ++ (devDependencies pkgs);
          };
        }
      );

      packages = forAllSystems (
        { pkgs, ... }:
        {
          devEnvironment = pkgs.buildEnv {
            name = "development environment";
            paths = (dependencies pkgs) ++ (devDependencies pkgs);
          };
        }
      );
    };
}
