{ pkgs               ? import <nixpkgs> {}
, patchGitHubRelease ? (import ../lib/patchGitHubRelease.nix) pkgs
, forPlatform        ? (import ../lib/dispatchPlatform.nix)   pkgs
, ...}:

let

  name    = "secretcli";
  version = "1.2.2";
  platform = forPlatform {
    "x86_64-linux" = {
      binary = "secretcli-Linux";
      sha256 = "1p0fhr4avwcmb4p54v05c266v0bzbdlr8gs2b6nrzn94mpfhb56l";
    };
    "x86_64-darwin" = {
      binary = "secretcli-macOS";
      sha256 = "sha256-e/jGFTrafSXapOoHLJfPKwfxXRSReIDyB9ODU2006Jk=";
    };
  };

in (patchGitHubRelease
  "${name}-${version}"
  "https://github.com/enigmampc/SecretNetwork/releases/download/v${version}/${platform.binary}"
  platform.sha256
  ''ls -al; install -m755 -D $src $out/bin/secretcli'')
