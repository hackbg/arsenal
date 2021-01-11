{ pkgs ? import <nixpkgs> {} }: let

in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    neo-cowsay fortune # testing
    git tig ripgrep
    nodejs-14_x yarn
    rustc cargo pkgconfig
    ((import ./neovim.nix) pkgs)
    ((import ./ganache.nix) pkgs)
  ];

  shellHook = ''
    fortune | cowsay
  '';
}
