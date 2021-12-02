{pkgs ? import <nixpkgs> {}, ...}: let

  name    = "lazynpm";
  version = "0.1.4";

  system   = pkgs.stdenv.hostPlatform.system;
  platform = if system == "x86_64-linux"  then "Linux_x86_64"  else
             if system == "x86_64-darwin" then "Darwin_x86_64" else
             "unsupported_platform";

  patchGitHubRelease = (import ../lib/patchGitHubRelease.nix) pkgs;

in patchGitHubRelease
  "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform}.tar.gz"
  "0cvn4bygi51819jqvxyc3asqm16zd7kwv7r7b3fwzyx9dxv254rx"
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
