{ pkgs ? import <nixpkgs> {} }: let

  pkg = src: (pkgs.buildEnv ((import src) pkgs));

in {
  go       = pkg ./go;
  rust     = pkg ./rust;
  js       = pkg ./js;
  solidity = pkg ./solidity;

  gl       = pkg ./gl;
  util     = pkg ./util;

  neovim   = pkg ./ide/neovim.nix;
  vscode   = pkg ./ide/vscode.nix;
}
