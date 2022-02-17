# This file defines the extra packages contained by the `hackbg` package group.

{ pkgs ? import <nixpkgs> {} }: let

  env = src: (pkgs.buildEnv ((import src) pkgs));
  pkg = src: (pkgs.callPackage (import src) {});

in {

  # Golang and utilites written in it
  go         = env ./go;
  secretcli  = pkg ./go/secretcli.nix;
  lazydocker = pkg ./go/lazydocker.nix;
  lazygit    = pkg ./go/lazygit.nix;
  lazynpm    = pkg ./go/lazynpm.nix;

  # Rust
  rust = env ./rust;

  # JavaScript
  js  = env ./js;
  nvm = pkg ./js/nvm.nix;

  # Solidity
  solidity = env ./solidity;

  # OpenGL
  gl = env ./gl;

  # Misc utilities
  util = env ./util;

  # Editors
  neovim = env ./ide/neovim.nix;
  vscode = env ./ide/vscode.nix;

}
