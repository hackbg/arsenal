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

