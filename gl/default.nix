{ pkgs?import<nixpkgs>{} }: {
  name = "hackbg-arsenal-gl";
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang}/lib";
  LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath (with pkgs; [
    xorg.libxcb
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xlibs.libX11
    libglvnd
  ]);
}
