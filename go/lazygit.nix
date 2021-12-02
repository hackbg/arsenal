{pkgs ? import <nixpkgs> {}, ...}: let

  name    = "lazygit";
  version = "0.31.4";

  system   = pkgs.stdenv.hostPlatform.system;
  platform = if system == "x86_64-linux"  then "Linux_x86_64"  else
             if system == "x86_64-darwin" then "Darwin_x86_64" else
             "unsupported_platform";

  patchGitHubRelease = (import ../lib/patchGitHubRelease.nix) pkgs;

in patchGitHubRelease
  "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform}.tar.gz"
  "02vhr6c8wncf9ilbh3xas83cq5zgdgwzys78y6jwcwhgvw3yrnv2"
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
