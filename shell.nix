{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    neo-cowsay fortune            # Sanity check
    nix-index                     # find files in Nix repo
    git tig                       # VCS
    ripgrep tmux                  # Utilities
    ((import ./pkgs/neovim.nix) pkgs)  # Text editor

    solc                          # Solidity platform
    go_1_14                       # Go 1.14.12 as recommended by CosmWasm docs

    (pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix) {})
    # FIXME: those don't build under Nix out of the box:
    #(pkgs.callPackage (import ./pkgs/wasmd-0.11.0.nix) {})
    #(pkgs.callPackage (import ./pkgs/wasmd-0.13.0.nix) {})
    #((import ./pkgs/ganache.nix) pkgs) # Local blockchain
  ] ++ ((import ./pkgs/node.nix) pkgs)
    ++ ((import ./pkgs/rust.nix) pkgs);

  shellHook = ''
    rustup target add wasm32-unknown-unknown
    source heldernet.env
    fortune | cowsay
  '';

}
