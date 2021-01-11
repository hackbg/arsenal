* Based on [Nix](https://nixos.org/download.html) package manager.
* Nix is hooked into user environment via `~/.profile`
* Home directory is a Git repo.
* Everything is `.gitignore`d by default.
* The entry point is `shell.nix`; run `nix-shell` to activate it.
* `neovim.nix` contains an installation of Neovim and plugins.
* TODO: vim-tmux-navigator
* FIXME: Ganache (https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage)
  is deployed as AppImage (type 2) of Electron App. Nix fails to launch it.
