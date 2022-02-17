# This file exports a single function, which adds the `hackbg` package group
# (defined in `pkgs.nix`) to the instance of Nixpkgs used to instantiate the
# Arsenal environment (in `shell.nix`).

self: super: {
  hackbg = import ./pkgs.nix {
    pkgs = import <nixpkgs> {
      overlays = [

        # One overlay provides a recent version of Rust.
        (import (builtins.fetchTarball {
          url    = "https://github.com/hackbg/nixpkgs-mozilla/archive/master.tar.gz";
          sha256 = "1kapba23cy3y1ghyqpm0rapbrfj3qdkd7v58c6g8bhpys9qq1aic";
        }))

        # The other provides a recent version of Neovim.
        (import (builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
        }))

      ];
    };
  };
}
