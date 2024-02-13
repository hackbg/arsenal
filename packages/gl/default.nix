{ pkgs, lib, llvmPackages, xorg, xlibs, libglvnd, ... }: {
  name = "hackbg-arsenal-gl";
  paths = [];
  postBuild = ''
    export LIBCLANG_PATH=${llvmPackages.libclang}/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${lib.strings.makeLibraryPath [
      xorg.libxcb
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXi
      xlibs.libX11
      libglvnd
    ]}
  '';
}
