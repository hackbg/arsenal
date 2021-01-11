{buildGoModule
,fetchFromGitHub
}: buildGoModule rec {
  pname = "wasmd";
  version = "0.13.0";
  src = fetchFromGitHub {
    owner = "CosmWasm";
    repo = "wasmd";
    rev = "v${version}";
    sha256 = "1w4kgsd3cb149vpzdkcz66pz91hfdwxjv766f6si9vxvsmlqn6bi";
  };
  vendorSha256 = "02b46g68dxi8i7fp0781b9fpnqdljhhqs3r8ihi5ks04vvr40fzl";
  deleteVendor = true;
  runVend = true;

  # this hides the /build/source directory, so that the fixup phase
  # knows to remove RPATH references to it from the resulting binaries
  preFixup = ''mv /build/source /build/source.nah'';
}
