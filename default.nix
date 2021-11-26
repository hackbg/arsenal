self: super: {
  hackbg = import ./pkgs.nix {
    pkgs = import <nixpkgs> {
      overlays = [
        (import (builtins.fetchTarball {
          url    = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
          sha256 = "1kapba23cy3y1ghyqpm0rapbrfj3qdkd7v58c6g8bhpys9qq1aic";
        }))
      ];
    };
  };
}
