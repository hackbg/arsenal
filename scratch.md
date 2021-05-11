## What works

* `shell.nix` defines what happens when you run `nix-shell` in the repo root.
  1. Make available the software requested in:
    * `pkgs/utilities.nix`: Git, RipGrep, Tmux, Nix-Index, Entr, CLOC
    * `pkgs/node.nix`: adds `node 14.15.4`, `npm 6.14.10`, `yarn 1.22.10`.
    * `pkgs/rust.nix`: adds `rustup 1.23.1` with settings for current CosmWasm projects.
    * `pkgs/solidity.nix`: adds `solc 0.7.1`.
    * `pkgs/neovim.nix`: NeoVim + plugins
  2. Activate configuration from `cfg/`
    * This sets Rust to `nightly` and `wasm32-unknown-unknown`,
      and may check some Rust components for updates.
* Docker (provided by your OS) still works fine under Nix because it's based
  on monolithic artifacts that contain their own "static copy of the universe".
  * However `shell.nix` is unable to install its own Docker daemon just yet

## What might not
* If you also have `rustup` installed outside of Nix, they might conflict
  with each other other (`GLIBC_2_32 not found`, etc.)
  * I wonder whether native binaries built by Rust inside the shell
    should link to the host system's libraries or to the ones provided by Nix.
  * This only matters for production releases of off-chain software, since
    of what we're working on is distributed between us in source form anyway.

## What should be fixed
* This is a preliminary effort, `default.nix`/`shell.nix` for individual
  projects might make more sense. This gives you instant dev environments and
  reproducible builds in one package.
  * [NixPkgs](https://github.com/NixOS/nixpkgs) is a huge (larger than AUR!)
    collection of (mostly) up-to-date software
      * [Search in NixPkgs](https://search.nixos.org/packages) here
      * use `nix-index` and `nix-locate --top-level` to search in your local copy
      * Nix needs "valid build instructions for the whole universe" so that it can
        works IF AND ONLY IF meaningfully reproducible builds are possible.
      * https://github.com/crev-dev/cargo-crev might also need to be integrated along the way
* Somebody should have invented this earlier, because while NixPkgs maintainers
  were amassing a corpus of build instructions for the whole stack, the goalposts moved.
  * The brokenness of the pre-Nix distro model has caused every language to
    evolve its own OS-independent package manager. Nix makes an attempt to
    [integrate with some of those](https://nixos.org/manual/nixpkgs/stable/#chap-language-support),
    which I personally find half-hearted.
    * In some important cases, such as Node, Electron, and Go, this is still
      more difficult than it ought to be.
      * Maybe I just don't "get it" but the docs don't help much either.
      * [Nix+Go](https://nixos.org/manual/nixpkgs/stable/#sec-language-go)
      * [Nix+Node](https://nixos.org/manual/nixpkgs/stable/#node.js)
      * [More language-specific Nix helpers](https://nixos.wiki/wiki/Language-specific_package_helpers)
      * The solution are `fixed output derivations`: when writing a Nix package
        that uses `yarn`, `npm`, any package manager that accesses the network
        really, just let it do that and provide SHA256 sums for __both__ the
        input and the output.
        * In theory, this is enough to allow Nix to work with any package, even
          binary blobs (AppImages under NixOS are another story...)

* CosmWasm
  * ***FIXME*** Under Nix, `RPATH of wasmd contains forbidden reference
    to /build/` (which means it cannot be built reproducibly, or I'm not using the
    Nix+Go integration correctly).
    * **FIXME** After fixing by renaming the `/build/source` temporary dir to
      something else, the binary fails to find the `go-cosmwasm` (0.11) a.k.a.
      `wasmvm` (0.13) library from [here](https://github.com/CosmWasm/wasmvm).
  * ***HOWTO*** to build outside of Nix, you need `snap install go`,
    `apt install make gcc`, and maybe [golangci-lint](https://golangci-lint.run/usage/install/#linux-and-windows)
    which is installed with another `curl|sh` (and here I am thinking one such
    invocation is already too many)
  * ***HOWTO*** Make sure `GOPATH` is set
    (`export GOPATH=/home/username/.go` in `~/.profile`).
    Then run `make install` in a checkout of [Wasmd](https://github.com/CosmWasm/wasmd/tree/v0.13.0)
    as per [the docs](https://docs.cosmwasm.com/0.13/getting-started/installation.html).
  * ***WTF*** Ubuntu 20.04.1 doesn't provide `Go 1.14`;
    just `1.15` in snap and 2 variants of `1.13` in apt
  * ***WTF***  Why do mainnet and testnet [require different versions
    of `wasmd`](https://docs.cosmwasm.com/v0.13/getting-started/installation.html#wasmd)?
  * ***WTF*** `make` fails due to linter errors
  * ***WTF*** `0.13.0` doesn't contain `wasmcli` anymore, only `wasmd`?

* Ganache
  * ***FIXME*** `pkgs/ganache.nix` deploys Ganache from
    [the official release](https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage).
    The artifact is a Type 2 AppImage of an Electron App.
    This fails to run inside Nix, showing a blank screen instead.
    It works fine outside of Nix, though.
  * ***WIP*** Package [ganache-cli](https://github.com/trufflesuite/ganache-cli)
    instead.
    * ***WIP***: use `yarn import` to generate `yarn.lock` for projects that don't
      have it, then use [the Haskell version of yarn2nix](https://github.com/Profpatsch/yarn2nix)
      to generate frozen list of dependencies. (This failed to handle a circular
      dependency between `global-modules@^1.0.0` and `resolve-dir@1.0.1` in
      Webpack)
    * ***WIP***: Trying [Napalm](https://github.com/nmattia/napalm).
      Doesn't seem to handle `git://` dependencies.
    * ***WIP***: Trying [node2nix](https://github.com/svanderburg/node2nix)

