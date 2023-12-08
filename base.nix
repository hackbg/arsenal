pkgs: let system = pkgs.stdenv.hostPlatform.system; in {

  forPlatform = platforms: if platforms ? ${system}
    then platforms.${system}
    else throw "Unsupported platform: ${system}";

  gitHubRelease = name: url: sha256: installPhase: pkgs.stdenv.mkDerivation {
    inherit name installPhase;
    src = pkgs.fetchurl { inherit url sha256; };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    unpackPhase = "true";
  };

}
