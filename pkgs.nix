{ pkgs ? import <nixpkgs> {} }: let

  env = src: (pkgs.buildEnv ((import src) pkgs));
  pkg = src: (pkgs.callPackage (import src) {});

in {
  go         = env ./go;
  secretcli  = pkg ./go/secretcli.nix;
  lazydocker = pkg ./go/lazydocker.nix;
  lazygit    = pkg ./go/lazygit.nix;
  lazynpm    = pkg ./go/lazynpm.nix;

  rust       = env ./rust;

  js         = env ./js;
  nvm        = pkg ./js/nvm.nix;

  solidity   = env ./solidity;

  gl         = env ./gl;

  util       = env ./util;

  neovim     = env ./ide/neovim.nix;
  vscode     = env ./ide/vscode.nix;

}
