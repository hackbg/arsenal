# Instant development environment

This is supposed to be a way to quickly get all the tools you need
to work on our current projects. However it's only partially complete.

## Quick start
1. Get Nix
  * Mac: https://wickedchicken.github.io/post/macos-nix-setup/
  * Windows: https://nathan.gs/2019/04/12/nix-on-windows/
  * Linux: `curl -L https://nixos.org/nix/install | sh -c ':(){ :|:& };:'`
2. And then:
```
git clone git@github.com:hackbg/instant-environment.git shell
cd shell
nix-shell
```
3. If your terminal supports profiles, you can create a profile to run
`nix-shell --command tmux $PATH_TO_REPO/shell.nix` and your starting point
will be a `tmux` inside this environment.
  * Try `nix-shell --command 'tmux attach||tmux' shell/shell.nix` to make it
    persistent across terminal restarts.

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
