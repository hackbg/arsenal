{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    neo-cowsay fortune            # testing
    nix-index                     # find files in Nix repo
    git tig ripgrep               # VCS and text manipulation
    nodejs-14_x yarn              # Node platform
    rustc cargo pkgconfig         # Rust platform
    solc                          # Solidity platform
    ((import ./neovim.nix) pkgs)  # Text editor
    ((import ./ganache.nix) pkgs) # Local blockchain
  ];

  shellHook = ''
    fortune | cowsay
  '';
}
