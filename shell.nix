{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = let
    pkglist = x: ((import (./pkgs + "/${x}")) pkgs);
  in with pkgs; [
    #(pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix)      {})
    #(pkgs.callPackage (import ./pkgs/ganache-cli.node2.nix) {})

    # FIXME: those don't build under Nix out of the box:
    #(pkgs.callPackage (import ./pkgs/wasmd-0.11.0.nix) {})
    #(pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix) {})
    #(pkgs.callPackage (import ./pkgs/ganache.nix) {}) # Local blockchain

    entr
    cloc
  ] ++ (pkglist "utilities.nix")
    ++ (pkglist "neovim.nix")
    ++ (pkglist "node.nix")
    ++ (pkglist "rust.nix")
    ++ (pkglist "wireshark.nix")
    #++ (pkglist (./pkgs/go.nix) pkgs)
    ++ (pkglist "solidity.nix")
    ;

  shellHook = let
    cfg = path: builtins.readFile (./cfg + "/${path}");
  in builtins.concatStringsSep "\n" [
    (cfg "alias.sh")
    (cfg "prompt.sh")
    (cfg "rust.sh")
    "fortune | cowsay"
  ];

  EDITOR = "nvim";


}
