{ pkgs ? import <nixpkgs> { overlays = [ (import ./.) ]; } }: pkgs.mkShell {

  name = "hackbg-arsenal";

  propagatedBuildInputs = with pkgs; [
    hackbg.js
    hackbg.neovim
    hackbg.rust
    hackbg.secretcli
    hackbg.util
    #hackbg.vscode

    pkg-config
    openssl

    hackbg.lazydocker
    hackbg.lazygit
    hackbg.lazynpm
  ];

  shellHook = ''
    ${builtins.readFile ./rust/rust.sh}
    ${builtins.readFile ./bash/prompt.sh}
    fortune|cowsay
  '';

  EDITOR  = "nvim";
  BROWSER = "surf";

}
