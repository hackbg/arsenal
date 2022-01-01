{ pkgs ? import <nixpkgs> { overlays = [ (import ./.) ]; } }: pkgs.mkShell {

  name = "hackbg-arsenal";

  propagatedBuildInputs = with pkgs; [
    hackbg.js
    hackbg.nvm

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
    ${builtins.readFile ./js/js.sh}
    source "${pkgs.hackbg.nvm.out}/nvm.sh"
    fortune|cowsay
  '';

  EDITOR  = "nvim";
  BROWSER = "surf";

}
