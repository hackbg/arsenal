with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "secretsh";
  buildInputs = with pkgs; [ gnumake go go-bindata ];
}
