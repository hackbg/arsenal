{
  pkgs ? (import <nixpkgs> { overlays = ../overlays.nix; }),
  extraBuildInputs ? [],
  extraNativeBuildInputs ? [],
  extraShellHook ? "",
  ...
}: pkgs.mkShell {

  name = "rust";

  buildInputs = []
    ++ extraBuildInputs;

  nativeBuildInputs = with pkgs; [ cargo rustc ]
    ++ extraNativeBuildInputs;

  shellHook = ""
    + extraShellHook;

}
