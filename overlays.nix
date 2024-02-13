let

  # Define overlay from SHA256 and URL
  addOverlay = sha256: url: let
    tarball = (builtins.fetchTarball { inherit url sha256; });
  in
    import tarball;

  # Define overlay from GitHub repo
  addGitHubOverlay = repo: commit: sha256: let
    tarballUrl = "https://github.com/${repo}/archive/${commit}.tar.gz";
  in
    (addOverlay sha256 tarballUrl);


in [

  # Rust from Mozilla's overlay
  (addGitHubOverlay
    "mozilla/nixpkgs-mozilla"
    "78e723925daf5c9e8d0a1837ec27059e61649cb6"
    "0k3jxk21s28jsfpmqv39vyhfz2srfm81kp4xnpzgsbjn77rhwn03")

  # Neovim nightly
  #(ghOverlay
    #"nix-community/neovim-nightly-overlay"
    #"2a37ff325707cbe46dab1ff1d89ed340e46cd440"
    #"0l109bmmnbby7szp3inh9czvla26czxmcwndyjfc8zkkmad3qlw7")

  # Our custom packages
  (import ./packages/overlay.nix)

]
