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
        # We cannot get the version with Nix in pure mode. The build process
        # could add a `.version` and commit it. See for example:
        # https://github.com/akvorado/akvorado/blob/8686e1cbd23328af4d29fd216b673f87345be4e5/docker/Dockerfile#L6
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
