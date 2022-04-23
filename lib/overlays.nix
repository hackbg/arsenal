[

  # One overlay provides a recent version of Rust.
  (import (builtins.fetchTarball {
    url    = "https://github.com/hackbg/nixpkgs-mozilla/archive/master.tar.gz";
    sha256 = "0admybxrjan9a04wq54c3zykpw81sc1z1nqclm74a7pgjdp7iqv1";
  }))

  # The other provides a recent version of Neovim.
  (import (builtins.fetchTarball {
    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  }))

]
