pkgs:
  let
    system = pkgs.stdenv.hostPlatform.system;
  in
    platforms:
      if platforms ? ${system}
        then platforms.${system}
        else throw "Unsupported platform: ${system}"
