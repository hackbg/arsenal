pkgs: name: url: sha256: installPhase: pkgs.stdenv.mkDerivation {
  inherit name installPhase;
  src = pkgs.fetchurl { inherit url sha256; };
  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  phases = [ "patchPhase" "installPhase" ];
}
