{pkgs ? import <nixpkgs> {}, ...}: let

  name    = "lazydocker";
  version = "0.12";

  system   = pkgs.stdenv.hostPlatform.system;
  platform = if system == "x86_64-linux"  then "Linux_x86_64"  else
             if system == "x86_64-darwin" then "Darwin_x86_64" else
             "unsupported_platform";

  patchGitHubRelease = (import ../lib/patchGitHubRelease.nix) pkgs;

in patchGitHubRelease
  "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform}.tar.gz"
  "1z3i0afkg63sf8d4qw5fkaibv8122776z9ycrsf0k27bmhrnwbd5"
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
