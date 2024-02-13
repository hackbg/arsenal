{ pkgs ? import <nixpkgs> {}, ... }:
  with import ../../base.nix pkgs;
let
  name     = "lazygit";
  version  = "0.31.4";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "Linux_x86_64";
      sha256 = "02vhr6c8wncf9ilbh3xas83cq5zgdgwzys78y6jwcwhgvw3yrnv2";
    };
    "x86_64-darwin" = {
      suffix = "Darwin_x86_64";
      sha256 = "1874wcr2mfvcdllfxvk1yz8il8kd5azsvhcv69x1a85b8wkd04l2";
    };
  };
in gitHubRelease "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
