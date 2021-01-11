* Based on [Nix](https://nixos.org/download.html) package manager.
  Nix is hooked into user environment via `~/.profile`

* Home directory is a Git repo.
  Everything is `.gitignore`d by default.

* The entry point is `shell.nix`.
  Run `nix-shell` to activate it.
  See [NixOS Packages](https://search.nixos.org/packages) for package list.
  Individual files can be sought with `nix-locate` (call `nix-index` once before).

* `neovim.nix` contains an installation of Neovim and plugins.
  TODO: integrate vim-tmux-navigator

* Node support: `node 14.15.4`, `npm 6.14.10`, `yarn 1.22.10` in `shell.nix`.

* Rust support: `rustup 1.23.1` in `shell.nix`.

* Solidity support: `solc 0.7.1` in `shell.nix`.

* FIXME: CosmWasm: RPATH of wasmd contains forbidden reference to `/build/`
  (which means it cannot be built reproducibly, or I'm not using the Nix+Go
  integration correctly). So for now just build it outside of Nix, which
  requires Go (`snap install go` for v1.15), Make, GCC,
  [golangci-lint](https://golangci-lint.run/usage/install/#linux-and-windows).
  `GOPATH` must be set (`export GOPATH=/home/username/.go` in `~/.profile`).
  Then run `make` and `make install` in checkout of [Wasmd](https://github.com/CosmWasm/wasmd/tree/v0.13.0).

* WTF: https://docs.cosmwasm.com/v0.13/getting-started/installation.html#wasmd
  Why do mainnet and testnet require different versions of `wasmd`?

* FIXME: `ganache.nix` deploys Ganache from (https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage).
  However since it's an AppImage (type 2) of an Electron App, it fails to run.
  So for now just run the AppImage outside of Nix.
