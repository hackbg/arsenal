{ pkgs               ? import <nixpkgs> {}
, patchGitHubRelease ? (import ../lib/patchGitHubRelease.nix) pkgs
, forPlatform        ? (import ../lib/dispatchPlatform.nix)   pkgs
, ...}:

let

  name    = "lazygit";
  version = "0.31.4";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "Linux_x86_64";
      sha256 = "02vhr6c8wncf9ilbh3xas83cq5zgdgwzys78y6jwcwhgvw3yrnv2";
    };
    "x86_64-darwin" = {
      suffix = "Darwin_x86_64";
      sha256 = "02vhr6c8wncf9ilbh3xas83cq5zgdgwzys78y6jwcwhgvw3yr000";
    };
  };

in (patchGitHubRelease
  "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al'')
