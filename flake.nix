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
        go = pkgs.go_1_24;
      in
      {
        packages.default = pkgs.buildGoModule.override { inherit go; } {
          name = "hellogopher";
          src = ./.;
          vendorHash = "sha256-Z3DQZ6bleZ3hs0r+WtvgZuFuqGsOJrjnZXRz1Wbyh8o=";
          buildPhase = ''
            make all
          '';
          installPhase = ''
            mkdir -p $out/bin
            cp bin/* $out/bin/.
          '';
        };
      });
}
