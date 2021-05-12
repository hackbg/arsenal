{pkgs?import<nixpkgs>{}}: let

  arsenal = (import ./lib) pkgs;

in pkgs.mkShell {

  name = "gl-dev-shell";

  nativeBuildInputs = arsenal.packages [
    ./lib/util.nix
    ./lib/neovim.nix
    ./lib/node.nix
    ./lib/rust.nix
  ];

  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath (with pkgs; [
    xorg.libxcb
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xlibs.libX11
    libglvnd
  ]);

  shellHook = arsenal.environment [
    ./lib/alias.sh
    ./lib/prompt.sh
    ./lib/rust.sh
    ./lib/fortune.sh
  ];

  EDITOR = "nvim";

}
