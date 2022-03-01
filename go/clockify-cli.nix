{ pkgs ? import <nixpkgs> {}
, patchGitHubRelease ? (import ../lib/patchGitHubRelease.nix) pkgs
, forPlatform        ? (import ../lib/dispatchPlatform.nix)   pkgs
, ...}:

let

  name     = "clockify-cli";
  version  = "0.32.2";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "Linux_x86_64";
      sha256 = "06saqw0l3vj1gy12iln1ra49bxrwrckv8rwv9m4rjip2a5sc8a80";
    };
    "x86_64-darwin" = {
      suffix = "Darwin_x86_64";
      sha256 = "1shld5kxv0insz8xqyahxhjwybn3bhnn57kn25p3pcaxxkf70000";
    };
  };

in (patchGitHubRelease
  "${name}-${version}"
  "https://github.com/lucassabreu/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al'')

