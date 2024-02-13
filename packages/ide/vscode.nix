{ pkgs, ... }: let

  my-vscodium = pkgs.vscodium-fhs-with-extensions.overrideAttrs (attrs: {
    nativeBuildInputs = attrs.buildInputs
      ++ [ (pkgs.buildEnv ((import ../rust) pkgs)) ]; });

  my-vscodium-with-extensions = my-vscodium.override {
    vscodeExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      { name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b"; }
      { name = "rust";
        publisher = "rust-lang";
        version = "0.7.8";
        sha256 = "039ns854v1k4jb9xqknrjkj8lf62nfcpfn0716ancmjc4f0xlzb3"; } ]; };

in {
  name = "hackbg-arsenal-vscode";
  paths = [ my-vscodium-with-extensions ]; }
