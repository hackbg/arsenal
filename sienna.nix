{pkgs?import<nixpkgs>{}}: let

  arsenal = (import ./lib) pkgs;

in pkgs.mkShell {

  name = "sienna-dev-shell";

  nativeBuildInputs = arsenal.packages [
    ./lib/util.nix
    ./lib/neovim.nix
    ./lib/node.nix
    ./lib/rust.nix
  ];

  shellHook = arsenal.environment [
    ./lib/alias.sh
    ./lib/prompt.sh
    ./lib/rust.sh
    ./lib/fortune.sh
  ];

  EDITOR = "nvim";

}
