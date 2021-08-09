{ pkgs ? import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; } }: pkgs.mkShell {

  name = "hackbg-arsenal";

  propagatedBuildInputs = with pkgs; [
    hackbg.js
    hackbg.neovim
    hackbg.rust
    hackbg.util
  ];

  shellHook = ''
    ${builtins.readFile ./rust/rust.sh}
    ${builtins.readFile ./util/prompt.sh}
    fortune|cowsay
  '';

  EDITOR  = "nvim";
  BROWSER = "surf";

}
