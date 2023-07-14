{ ... }: let pkgs = import <nixpkgs> { overlays = import ./overlays.nix; }; in pkgs.mkShell {

  name = "hackbg-arsenal";

  # The packages in `propagatedBuildInputs` will be available in the shell.
  # The ones prefixed with `hackbg` are defined in `pkgs.nix` and added to
  # `pkgs` by the overlay defined in `default.nix`.
  propagatedBuildInputs = with pkgs; [

    pkg-config
    openssl

    hackbg.js
    hackbg.nvm

    hackbg.neovim
    hackbg.rust
    hackbg.secretcli
    hackbg.util
    hackbg.clockify-cli
    #hackbg.vscode

    hackbg.lazydocker
    hackbg.lazygit
    hackbg.lazynpm

    hexedit
    python310
    python310Packages.pip

  ];

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

}
