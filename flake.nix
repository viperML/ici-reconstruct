{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {pkgs, ...}: {
        devShells.render = with pkgs; mkShellNoCC {
          packages = [
            tectonic
            pandoc
            just
          ];
        };

        devShells.code = with pkgs; mkShellNoCC {
          packages = [
            julia-bin
          ];
        };
      };
    };
}
