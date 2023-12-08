{ pkgs ? import <nixpkgs> {}, ... }: with import ../base.nix pkgs; let
  name     = "lazydocker";
  version  = "0.12";
  platform = forPlatform {
    "x86_64-linux" = {
      suffix = "Linux_x86_64";
      sha256 = "1z3i0afkg63sf8d4qw5fkaibv8122776z9ycrsf0k27bmhrnwbd5";
    };
    "x86_64-darwin" = {
      suffix = "Darwin_x86_64";
      sha256 = "1shld5kxv0insz8xqyahxhjwybn3bhnn57kn25p3pcaxxkf71ynf";
    };
  };
in gitHubRelease "${name}-${version}"
  "https://github.com/jesseduffield/${name}/releases/download/v${version}/${name}_${version}_${platform.suffix}.tar.gz"
  platform.sha256
  ''mkdir -p $out/bin; cd $out/bin; tar -xf $src; ls -al''
