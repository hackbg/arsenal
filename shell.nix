{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    neo-cowsay fortune            # Sanity check
    nix-index                     # find files in Nix repo
    git tig                       # VCS
    ripgrep tmux                  # Utilities
    ((import ./neovim.nix) pkgs)  # Text editor

    nodejs-14_x yarn              # Node platform
    rustup                        # Rust platform
    solc                          # Solidity platform
    go_1_14                       # Go 1.14.12 as recommended by CosmWasm docs

    (pkgs.callPackage (import ./wasmd-0.11.0.nix) {})
    # FIXME: those don't build under Nix out of the box:
    #(pkgs.callPackage (import ./wasmd-0.13.0.nix) {})
    #((import ./ganache.nix) pkgs) # Local blockchain
  ];

  shellHook = ''
    rustup target add wasm32-unknown-unknown
    source heldernet.env
    fortune | cowsay
  '';

}
