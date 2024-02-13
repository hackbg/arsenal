import <nixpkgs> { overlays = import ./overlays.nix; }

#pkgs: oldPkgs: with oldPkgs.lib; let
  #overlays = (map import (import ./overlays.nix));
#in (foldl' (flip extends) (_: oldPkgs) overlays) pkgs
