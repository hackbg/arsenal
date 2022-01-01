{ pkgs               ? import <nixpkgs> {}
, patchGitHubRelease ? (import ../lib/patchGitHubRelease.nix) pkgs
, forPlatform        ? (import ../lib/dispatchPlatform.nix)   pkgs
, ...}:

let

  name    = "secretcli";
  version = "v1.0.4";
  platform = forPlatform {
    "x86_64-linux" = {
      binary = "secretcli-linux-amd64";
      sha256 = "1mlrns9d52ill3fn00fdxmp4r0lmmffz1w8qwpw7q1ac6y35ma8k";
    };
    "x86_64-darwin" = {
      binary = "secretcli-darwin-10.6-amd64";
      sha256 = "sha256-e/jGFTrafSXapOoHLJfPKwfxXRSReIDyB9ODU2Z86Jk=";
    };
  };

in (patchGitHubRelease
  "${name}-${version}"
  "https://github.com/enigmampc/SecretNetwork/releases/download/v${version}/${platform.binary}"
  platform.sha256
  ''ls -al; install -m755 -D $src $out/bin/secretcli'')
