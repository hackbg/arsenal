# Packages prefixed with `hackbg` are:
# - defined in `pkgs.nix`
# - added to `pkgs` by the overlay defined in `default.nix`.
pkgs: with pkgs; [

  pkg-config
  openssl

  hackbg.js
  hackbg.nvm

  hackbg.neovim
  hackbg.rust
  hackbg.bcrypt-tool
  hackbg.lazydocker
  hackbg.lazygit
  hackbg.lazynpm
  #hackbg.secretcli
  #hackbg.util
  #hackbg.clockify-cli
  #hackbg.vscode

  python310
  python310Packages.pip

  hexedit    # hex editor
  ripgrep    # find in files
  bfs        # find file
  fd         # find file
  jq         # parse json
  sd         # find and replace
  tokei      # line counter
  bandwidth  # net monitor
  grex       # regex from examples
  delta      # diff viewer
  kondo      # artifact cleaner
  peep       # compact pager
  cloc       # count lines of code
  entr       # watch for file changes
  feh        # image viewer
  fortune    # a little whimsy helps
  git        # opt-in to infinite branching undo history
  htop
  neo-cowsay # see fortune
  nix-index  # find stuff in nixpkgs
  #plantuml  # diagrams
  ripgrep    # find stuff in files fast
  tig        # view git history interactively
  tmux       # split terminals
  just
  bat
  wireshark
  tcpdump
  #surf
  lsd
  entr

]
