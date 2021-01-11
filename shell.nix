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

    # FIXME: those don't build under Nix out of the box:
    #(pkgs.callPackage (import ./wasmd.nix) {})
    #((import ./ganache.nix) pkgs) # Local blockchain
  ];

  shellHook = ''
    fortune | cowsay
    rustup target add wasm32-unknown-unknown
  '';
}
