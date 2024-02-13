{...}: let

  pkgs = import <nixpkgs> { overlays = import ./overlays.nix; };

in pkgs.mkShell {

  name = "hackbg-arsenal";

  shellHook = ''
    export PYTHONPATH=$HOME/.local/lib/python3.10/site-packages:$PYTHONPATH
    ${builtins.readFile ./packages/rust/rust.sh}
    ${builtins.readFile ./packages/bash/prompt.sh}
    ${builtins.readFile ./packages/js/js.sh}
    source "${pkgs.hackbg.nvm.out}/nvm.sh"
    fortune|cowsay
  '';

  EDITOR  = "nvim";

  BROWSER = "surf";

  # The packages in `propagatedBuildInputs` will be available in the shell.
  propagatedBuildInputs = import ./tools.nix pkgs;

}
