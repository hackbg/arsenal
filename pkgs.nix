{ pkgs ? import <nixpkgs> {} }: let

  env = src: (pkgs.buildEnv ((import src) pkgs));
  pkg = src: (pkgs.callPackage (import src) {});

in {
  go       = env ./go;
  rust     = env ./rust;
  js       = env ./js;
  solidity = env ./solidity;

  gl       = env ./gl;
  util     = env ./util;

  neovim   = env ./ide/neovim.nix;
  vscode   = env ./ide/vscode.nix;

  secretcli = pkg ./go/secretcli.nix;
}
