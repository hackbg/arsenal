let

  # Define overlay from SHA256 and URL
  overlay = sha256: url:
    (import (builtins.fetchTarball { inherit url sha256; }));
  
  # Define overlay from GitHub repo
  ghOverlay = repo: commit: sha256:
    (overlay sha256 "https://github.com/${repo}/archive/${commit}.tar.gz");

  # Rust from Mozilla's overlay
  rustOverlay = ghOverlay
    "mozilla/nixpkgs-mozilla"
    "78e723925daf5c9e8d0a1837ec27059e61649cb6"
    "0k3jxk21s28jsfpmqv39vyhfz2srfm81kp4xnpzgsbjn77rhwn03";

  # Neovim nightly
  nvimOverlay = ghOverlay
    "nix-community/neovim-nightly-overlay"
    "2a37ff325707cbe46dab1ff1d89ed340e46cd440"
    "0l109bmmnbby7szp3inh9czvla26czxmcwndyjfc8zkkmad3qlw7";

  # Our custom packages
  hackBgOverlay = self: super: let
    env = src: (self.buildEnv ((import src) self));
    pkg = src: (self.callPackage (import src) {});
  in {
    hackbg = {
      bcrypt-tool  = pkg ./go/bcrypt-tool.nix;
      clockify-cli = pkg ./go/clockify-cli.nix;
      gl           = env ./gl;
      go           = env ./go;
      js           = env ./js;
      lazydocker   = pkg ./go/lazydocker.nix;
      lazygit      = pkg ./go/lazygit.nix;
      lazynpm      = pkg ./go/lazynpm.nix;
      neovim       = env ./ide/neovim.nix;
      nvm          = pkg ./js/nvm.nix;
      rust         = env ./rust;
      secretcli    = pkg ./go/secretcli.nix;
      solidity     = env ./solidity;
      util         = env ./util;
      vscode       = env ./ide/vscode.nix;
    };
  };

in [

  rustOverlay

  #nvimOverlay

  hackBgOverlay

]
