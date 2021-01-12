pkgs: let
  napalm = pkgs.callPackage ../napalm {};
in napalm.buildPackage ./ganache-cli {
  nativeBuildInputs = with pkgs; [ git ];
}
