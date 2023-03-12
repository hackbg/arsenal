# This file exports a single function, which adds the `hackbg` package group
# (defined in `pkgs.nix`) to the instance of Nixpkgs used to instantiate the
# Arsenal environment (in `shell.nix`).
self: super: let

  pkgs = import ./pkgs.nix {

    overlays = [
      # One overlay provides a recent version of Rust.
      (import (builtins.fetchTarball (let
        commit = "78e723925daf5c9e8d0a1837ec27059e61649cb6";
      in {
        url    = "https://github.com/mozilla/nixpkgs-mozilla/archive/${commit}.tar.gz";
        sha256 = "0k3jxk21s28jsfpmqv39vyhfz2srfm81kp4xnpzgsbjn77rhwn03";
      })))

      # The other provides a recent version of Neovim.
      #(import (builtins.fetchTarball (let
        #commit = "2a37ff325707cbe46dab1ff1d89ed340e46cd440";
      #in {
        #url = "https://github.com/nix-community/neovim-nightly-overlay/archive/${commit}.tar.gz";
        #sha256 = "0l109bmmnbby7szp3inh9czvla26czxmcwndyjfc8zkkmad3qlw7";
      #})))
    ];

  };

in {
  hackbg = import ./contents.nix { inherit pkgs; };
}
