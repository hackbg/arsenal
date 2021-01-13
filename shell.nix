{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    #(pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix)      {})
    #(pkgs.callPackage (import ./pkgs/ganache-cli.node2.nix) {})

    # FIXME: those don't build under Nix out of the box:
    #(pkgs.callPackage (import ./pkgs/wasmd-0.11.0.nix) {})
    #(pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix) {})
    #(pkgs.callPackage (import ./pkgs/ganache.nix) {}) # Local blockchain
  ] ++ ((import ./pkgs/utilities.nix) pkgs)
    ++ ((import ./pkgs/neovim.nix) pkgs)
    #++ ((import ./pkgs/node.nix) pkgs)
    #++ ((import ./pkgs/rust.nix) pkgs)
    #++ ((import ./pkgs/go.nix) pkgs)
    #++ ((import ./pkgs/solidity.nix) pkgs)
    ;

  shellHook = ''
    #rustup target add wasm32-unknown-unknown
    source heldernet.env
    fortune | cowsay
    #tmux attach || tmux
    #exit
  '';

}
