{ pkgs ? import <nixpkgs> {}, ... }: with import ../base.nix pkgs; let
  name     = "bcrypt-tool";
  version  = "1.1.5";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "linux_amd64";
      sha256 = "sha256-CDx2RMMwEMzT0mOdxTLhzfVCu4ZzukxoUhX+wdHTG0Y=";
    };
    "x86_64-darwin" = {
      suffix = "darwin_amd64";
      sha256 = "1shld5kxv0insz8xqyahxhjwybn3bhnn57kn25p3pcaxxkf70000";
    };
    "arm64-darwin" = {
      suffix = "darwin_arm64";
      sha256 = "1shld5kxv0insz8xqyahxhjwybn3bhnn57kn25p3pcaxxkf70000";
    };
  };
in gitHubRelease
  "${name}-${version}"
  "https://github.com/shoenig/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
