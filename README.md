* Based on [Nix](https://nixos.org/download.html) package manager.
  Nix is hooked into user environment via `~/.profile`

* Home directory is a Git repo.
  Everything is `.gitignore`d by default.

* The entry point is `shell.nix`.
  Run `nix-shell` to activate it.
  See [NixOS Packages](https://search.nixos.org/packages) for available packages.

* `neovim.nix` contains an installation of Neovim and plugins.
  TODO: vim-tmux-navigator

* FIXME: `ganache.nix` deploys Ganache from (https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage).
  However since it's an AppImage (type 2) of an Electron App, it fails to run.
  So for now just run the AppImage outside of Nix.

* `rustc 1.48.0` and `cargo 1.48.0` are installed from `shell.nix`.
