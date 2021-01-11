{buildGoPackage
,fetchFromGitHub
}: buildGoPackage rec {
  pname = "wasmd";
  version = "0.11.0";
  src = fetchFromGitHub {
    owner = "CosmWasm";
    repo = "wasmd";
    rev = "v${version}";
    sha256 = "150zg4paxq71jh5p71kg3nivw0hlm7qvh80ahpggwpc4acdcsig3";
  };
  goPackagePath = "github.com/CosmWasm/wasmd";
  subPackages = ["cmd/wasmd" "cmd/wasmcli"];
  goDeps = ./wasmd-0.11.0-deps.nix;

  # this hides the /build/source directory, so that the fixup phase
  # knows to remove RPATH references to it from the resulting binaries
  preFixup = ''mv /build/source /build/source.nah'';
}
