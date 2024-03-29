{ pkgs ? import <nixpkgs> {}, ... }:
  with import ../../base.nix pkgs;
let
  name     = "lazynpm";
  version  = "0.1.4";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "Linux_x86_64";
      sha256 = "0cvn4bygi51819jqvxyc3asqm16zd7kwv7r7b3fwzyx9dxv254rx";
    };
    "x86_64-darwin" = {
      suffix = "Darwin_x86_64";
      sha256 = "0b5xpdkh1nvh0pbgjyjfzv67lmqp9m7jzf58m10kkni7zvksvksr";
    };
  };
in gitHubRelease "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
