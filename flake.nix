{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      flake-utils,
      nixpkgs,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ ruby ];
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "baze";
          version = "1.1.1";
          src = ./.;

          buildInputs = [ pkgs.ruby ];

          installPhase = ''
            mkdir -p $out/bin
            cp -r bin/* $out/bin/
            chmod +x $out/bin/*
          '';
        };
      }
    );
}
