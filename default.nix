{ pkgs ? import <nixpkgs> {} }: let
  pkg = src: (pkgs.buildEnv ((import src) pkgs));
in {
  gl       = pkg ./gl;
  go       = pkg ./go;
  neovim   = pkg ./neovim;
  rust     = pkg ./rust;
  js       = pkg ./js;
  solidity = pkg ./solidity;
  util     = pkg ./util;
}
