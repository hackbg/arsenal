# This file exports a single function, which adds the `hackbg` package group
# (defined in `pkgs.nix`) to the instance of Nixpkgs used to instantiate the
# Arsenal environment (in `shell.nix`).
self: super: let

  pkgs = import ./pin.nix {

    overlays = [
      # One overlay provides a recent version of Rust.
      (import (builtins.fetchTarball (let
        commit = "0508a66e28a5792fdfb126bbf4dec1029c2509e0";
      in {
        url    = "https://github.com/mozilla/nixpkgs-mozilla/archive/${commit}.tar.gz";
        sha256 = "1b6p0rly0rywq60ks84ghc0n5zrqiafc2r64nlbnlkh9whmh5fmj";
      })))

      # The other provides a recent version of Neovim.
      (import (builtins.fetchTarball (let
        commit = "2a37ff325707cbe46dab1ff1d89ed340e46cd440";
      in {
        url = "https://github.com/nix-community/neovim-nightly-overlay/archive/${commit}.tar.gz";
        sha256 = "0l109bmmnbby7szp3inh9czvla26czxmcwndyjfc8zkkmad3qlw7";
      })))
    ];

  };

in {
  hackbg = import ./pkgs.nix { inherit pkgs; };
}
