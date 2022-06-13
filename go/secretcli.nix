{ pkgs               ? import <nixpkgs> {}
, patchGitHubRelease ? (import ../lib/patchGitHubRelease.nix) pkgs
, forPlatform        ? (import ../lib/dispatchPlatform.nix)   pkgs
, ...}:

let

  name    = "secretcli";
  version = "1.3.1";
  platform = forPlatform {
    "x86_64-linux" = {
      binary = "secretcli-Linux";
      sha256 = "sha256-QupNYyLlomTZ8aju3hdHRK5Q7awtGvrYrh4R4kTQzTs=";
    };
    "x86_64-darwin" = {
      binary = "secretcli-macOS";
      sha256 = "sha256-Wy+oAFF3aCYvsC9DXxuHyqKR7warqBZX6DrPk/np7kE=";
    };
  };

in (patchGitHubRelease
  "${name}-${version}"
  "https://github.com/enigmampc/SecretNetwork/releases/download/v${version}/${platform.binary}"
  platform.sha256
  ''ls -al; install -m755 -D $src $out/bin/secretcli'')
