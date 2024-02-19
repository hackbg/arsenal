{
  pkgs ? (import <nixpkgs> { overlays = ../overlays.nix; }),
  extraBuildInputs ? [],
  extraNativeBuildInputs ? [],
  extraShellHook ? "",
  ...
}: pkgs.mkShell {

  name = "next-with-prisma";

  buildInputs = with pkgs; [
    nodejs_20
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.node-gyp
    vips
    python3
    prisma-engines
    openssl
  ] ++ extraBuildInputs;

  nativeBuildInputs = with pkgs; []
    ++ extraNativeBuildInputs;

  shellHook = ''
    export PRISMA_MIGRATION_ENGINE_BINARY="${pkgs.prisma-engines}/bin/migration-engine"
    export PRISMA_QUERY_ENGINE_BINARY="${pkgs.prisma-engines}/bin/query-engine"
    export PRISMA_QUERY_ENGINE_LIBRARY="${pkgs.prisma-engines}/lib/libquery_engine.node"
    export PRISMA_FMT_BINARY="${pkgs.prisma-engines}/bin/prisma-fmt"
    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';

}
