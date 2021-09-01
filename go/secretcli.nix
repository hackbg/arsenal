{pkgs ? import <nixpkgs> {}, ...}:let
  repo    = "enigmampc/SecretNetwork";
  version = "v1.0.4";
  system  = pkgs.stdenv.hostPlatform.system;
  binary  = if system == "x86_64-linux"  then "secretcli-linux-amd64"       else
            if system == "x86_64-darwin" then "secretcli-darwin-10.6-amd64" else
            "unsupported_platform";
in pkgs.stdenv.mkDerivation {
  name =
    "secretcli-${version}";
  src =
    pkgs.fetchurl {
      url    = "https://github.com/${repo}/releases/download/${version}/${binary}";
      sha256 = "1mlrns9d52ill3fn00fdxmp4r0lmmffz1w8qwpw7q1ac6y35ma8k";
    };
  nativeBuildInputs =
    with pkgs; [ autoPatchelfHook ];
  phases =
    [ "patchPhase" "installPhase" ];
  installPhase =
    ''ls -al; install -m755 -D $src $out/bin/secretcli'';
}
