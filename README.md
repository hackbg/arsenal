# Instant development environment

Goal: use [Nix](https://nixos.org/download.html) to define a 100% reproducible,
distro-agnostic development environment.

Challenge: Many platforms (such as Electron or Go) try to provide their own
solution to dependency management as a "side quest" to their primary objective
of being a general-purpose programming environment. However, this does not play
well with Nix, whose _primary_ objective is solving dependency management by
disallowing non-reproducible builds via disabling most side effects (such as
network requests at build time).

Thus, to get an instant environment with all the build tools and dependencies,
the languages' package managers must be made to play along with Nix.
* [Nix+Go](https://nixos.org/manual/nixpkgs/stable/#sec-language-go)
* [Nix+Node](https://nixos.org/manual/nixpkgs/stable/#node.js)

## Quick start

```sh
curl -L https://nixos.org/nix/install | sh
git clone git@github.com:hackbg/instant-environment.git
cd instant-environment
nix-shell
```

## Features

* Node support: `node 14.15.4`, `npm 6.14.10`, `yarn 1.22.10` in `shell.nix`.
* Rust support: `rustup 1.23.1` in `shell.nix`.
* Solidity support: `solc 0.7.1` in `shell.nix`.
* Neovim + plugins: `pkgs/neovim.nix` specifies an installation of Neovim with
  plugins.
* TODO: integrate vim-tmux-navigator

## Obstacles, objections, and observations

* (Git) ***WARNING*** Everything is `.gitignore`d by default because this is
  based on my home directory. Any paths that should be under version control
  need to be explicitly specified in `.gitignore`.
* (Nix) ***WARNING*** `curl|sh`... really?
* (Nix) ***HOWTO*** The environment's entry point is `shell.nix`.
  Run `nix-shell` to activate it.
* (Nix) ***HOWTO*** See [NixOS Packages](https://search.nixos.org/packages) for
  package list. After calling `nix-index` once, individual files can be sought
  in the Nix repos with `nix-locate`, which returns a list of packages
  containing the file.
* (CosmWasm) ***FIXME*** Under Nix, `RPATH of wasmd contains forbidden reference
  to /build/` (which means it cannot be built reproducibly, or I'm not using the
  Nix+Go integration correctly).
  * **FIXME** After fixing by renaming the `/build/source` temporary dir to
    something else, the binary fails to find the `go-cosmwasm` (0.11) a.k.a.
    `wasmvm` (0.13) library from [here](https://github.com/CosmWasm/wasmvm).
* (CosmWasm) ***HOWTO*** to build outside of Nix, you need `snap install go`,
  `apt install make gcc`, and maybe [golangci-lint](https://golangci-lint.run/usage/install/#linux-and-windows)
  which is installed with another `curl|sh` (and here I am thinking one such
  invocation is already too many)
* (CosmWasm) ***HOWTO*** Make sure `GOPATH` is set
  (`export GOPATH=/home/username/.go` in `~/.profile`).
  Then run `make install` in a checkout of [Wasmd](https://github.com/CosmWasm/wasmd/tree/v0.13.0)
  as per [the docs](https://docs.cosmwasm.com/0.13/getting-started/installation.html).
* (CosmWasm) ***WTF*** Ubuntu 20.04.1 doesn't provide `Go 1.14`;
  just `1.15` in snap and 2 variants of `1.13` in apt
* (CosmWasm) ***WTF***  Why do mainnet and testnet [require different versions
  of `wasmd`](https://docs.cosmwasm.com/v0.13/getting-started/installation.html#wasmd)?
* (CosmWasm) ***WTF*** `make` fails due to linter errors
* (CosmWasm) ***WTF*** `0.13.0` doesn't contain `wasmcli` anymore, only `wasmd`?
* (Ganache) ***FIXME*** `pkgs/ganache.nix` deploys Ganache from
  [the official release](https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage).
  However, since it's an AppImage (type 2) of an Electron App, it fails to run
  inside Nix (with blank screen). So for now just run the AppImage outside of
  Nix.
