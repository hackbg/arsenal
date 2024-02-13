{ pkgs, fetchFromGitHub, stdenv, ... }: let
  version = "v0.39.1";
in stdenv.mkDerivation {
  name = "nvm";
  inherit version;
  src = fetchFromGitHub {
    owner  = "nvm-sh";
    repo   = "nvm";
    rev    = version;
    sha256 = "0x5w4v9hpns1p60d21q9diyq3lykpk2dlpcczcwdd24q6hmx5a4f";
  };
  phases = [ "installPhase" ];
  installPhase = ''cp -r $src/ $out/'';
}
