{...}: let
  pkgs = import <nixpkgs> { overlays = import ./overlays.nix; };
in pkgs.mkShell {
  name = "hackbg-arsenal";
  shellHook = ''
    export PYTHONPATH=$HOME/.local/lib/python3.10/site-packages:$PYTHONPATH
    ${builtins.readFile ./rust/rust.sh}
    ${builtins.readFile ./bash/prompt.sh}
    ${builtins.readFile ./js/js.sh}
    source "${pkgs.hackbg.nvm.out}/nvm.sh"
    fortune|cowsay
  '';
  EDITOR  = "nvim";
  BROWSER = "surf";
  # The packages in `propagatedBuildInputs` will be available in the shell.
  propagatedBuildInputs = import ./tools.nix pkgs;
}
