{
  pkgs?(import<nixpkgs>{}),
  extraBuildInputs?[],
  extraNativeBuildInputs?[],
  ...
}:pkgs.mkShell{

  name = "rust";

  buildInputs = []
    ++ extraBuildInputs;

  nativeBuildInputs = with pkgs; [ cargo rustc ]
    ++ extraNativeBuildInputs;

}
