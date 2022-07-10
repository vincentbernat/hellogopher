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
          vendorSha256 = "sha256-OTsiyR+BUvK1393KhiTmoLkVhMzmGgLxEfShFcdqVCs=";
          tags = ["release"];
        };
      });
}
