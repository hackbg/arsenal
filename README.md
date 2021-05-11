# Arsenal ⚔️💣☣️

This is a repository of [Nix Shells](https://nixos.org/manual/nix/unstable/command-ref/nix-shell.html)
that set up development environments for different projects.

## Quick start
1. [Get Nix](https://nixos.org/download.html)
  * Mac: https://wickedchicken.github.io/post/macos-nix-setup/
  * Windows: https://nathan.gs/2019/04/12/nix-on-windows/
  * Linux: `curl -L https://nixos.org/nix/install | sh -c ':(){ :|:& };:'`
2. Clone the repo
```bash
git clone git@github.com:hackbg/arsenal.git
```
3. Launch a shell
```bash
cd arsenal
nix-shell
```

### Protip

If your terminal supports profiles, you can create a profile that runs
this on start:
```bash
nix-shell --command 'tmux attach||tmux' PATH_TO_REPO/NAME_OF_SHELL.nix
```
This creates a persistent terminal session inside the environment.
