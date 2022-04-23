# This file exports a single function, which adds the `hackbg` package group
# (defined in `pkgs.nix`) to the instance of Nixpkgs used to instantiate the
# Arsenal environment (used in `shell.nix`).
self: super: {
  hackbg = import ./pkgs.nix {
    pkgs = import <nixpkgs> {
      overlays = import ./lib/overlays.nix;
    };
  };
}
