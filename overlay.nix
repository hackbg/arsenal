# You can use this file as a nixpkgs overlay. This is useful in the
# case where you don't want to add the whole NUR namespace to your
# configuration.
self: super: {
  hackbg = (import ./default.nix) {
    pkgs = import <nixpkgs> {
      overlays = [
        [ import (builtins.fetchTarball {
          url    = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
          sha256 = "1hpig8z4pzdwc2vazr6hg7qyxllbgznsaivaigjnmrdszlxz55zz"; }) ]
      ];
    };
  };
}
