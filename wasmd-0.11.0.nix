{buildGoModule
,fetchFromGitHub
}: buildGoModule rec {
  pname = "wasmd"; version = "0.11.0"; src = fetchFromGitHub {
    owner = "CosmWasm"; repo = "wasmd"; rev = "v${version}";
    sha256 = "150zg4paxq71jh5p71kg3nivw0hlm7qvh80ahpggwpc4acdcsig3";
  };
  vendorSha256 = "1w8fmcshjajmpa9w8fnaqxfi6z4lj3ja5gx62hi206syv6l5wwcj";
  #deleteVendor = true;
  runVend = true;
}
