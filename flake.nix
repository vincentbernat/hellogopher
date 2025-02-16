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
        packages.default = pkgs.buildGo124Module {
          name = "hellogopher";
          src = ./.;
          vendorHash = "sha256-H94VW02vcAj1vUqbIH+Wq3a/KRm6b0NPRb1SJLDf9gg=";
          tags = ["release"];
          env.CGO_ENABLED = "0";
        };
      });
}
