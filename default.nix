{pkgs?import<nixpkgs>{}}: let

  arsenal = (import ./lib) pkgs;

in pkgs.mkShell {

  name = "arsenal";

  nativeBuildInputs = arsenal.packages [
    ./lib/util.nix
    ./lib/neovim.nix
    ./lib/node.nix
    ./lib/rust.nix
  ];

  shellHook = arsenal.environment [
    ./lib/prompt.sh
    ./lib/alias.sh
    ./lib/rust.sh
  ];

  EDITOR = "nvim";

}
