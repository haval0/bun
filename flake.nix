{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
	  hardeningDisable = [ "fortify" ];

          buildInputs = with pkgs; [
	    bun
	    cmake
	    llvmPackages_19.llvm
	    llvmPackages_19.lld
	    llvmPackages_19.clang
	    ninja
	    cargo

	    ccache
	    git
	    go
	    libiconv
	    libtool
	    gnumake
	    pkg-config
	    python3
	    unzip
	    ruby

            typescript-language-server
          ];
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
