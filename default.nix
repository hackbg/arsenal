self: super: {
  hackbg = import ./pkgs.nix {
    pkgs = import <nixpkgs> {
      overlays = [
        (import (builtins.fetchTarball {
          url    = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
          sha256 = "1hpig8z4pzdwc2vazr6hg7qyxllbgznsaivaigjnmrdszlxz55zz";
        }))
      ];
    };
  };
}
