# cargo-tarpaulin # 0.17.0 - broken, yanked from crates.io
# build newer version
# based on: https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/tools/analysis/cargo-tarpaulin/default.nix
# tracking issue: https://github.com/NixOS/nixpkgs/issues/107158
pkgs: (pkgs.callPackage ({ lib, pkg-config, rustPlatform, fetchFromGitHub, openssl }: rustPlatform.buildRustPackage rec {
  pname   = "cargo-tarpaulin";
  version = "0.18.0-alpha3";
  src = fetchFromGitHub {
    owner  = "xd009642";
    repo   = "tarpaulin";
    rev    = version;
    sha256 = "1jk0srf8d1ij7rmigkjvklwpfyjady35zj8i6ziy39a2rah17n37";
  };
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];
  cargoSha256 = "18kl5x14d69z3bq192sjd8wkgc3p72bwmmyqg3ndfrqdfhdvhz1q";
  #checkFlags = [ "--test-threads" "1" ];
  doCheck = false;
  meta = with lib; {
    description = "A code coverage tool for Rust projects";
    homepage    = "https://github.com/xd009642/tarpaulin";
    license     = with licenses; [ mit /* or */ asl20 ];
    maintainers = with maintainers; [ hugoreeves ];
    platforms   = [ "x86_64-linux" ];
  };
}) {})
