{
  description = "hellogopher";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        packages.default = pkgs.buildGoModule {
          name = "hellogopher";
          src = ./.;
          vendorHash = "sha256-vttI+PEmx72vqWeSQo+V2J5hPsZoLu5GksJI3m02Mgg=";
          tags = ["release"];
          env.CGO_ENABLED = "0";
        };
      });
}
