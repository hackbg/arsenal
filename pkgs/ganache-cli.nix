pkgs: let
  yarn2nix = import ../yarn2nix {};
  nixLib = yarn2nix.nixLib;
  src = (pkgs.fetchFromGitHub {
    owner = "trufflesuite";
    repo = "ganache-cli";
    rev = "v6.12.1";
    sha256 = "1a4gsphv6spqplc1vhv6xn56kpa4nwyr6d21knz8b5bc7cmlhz7w";
  });
in
  nixLib.buildNodePackage
  ( { src = nixLib.removePrefixes [ "node_modules" ] ./ganache-cli; } //
    nixLib.callTemplate ./ganache-cli.template.nix
      (nixLib.buildNodeDeps (pkgs.callPackage ./ganache-cli.deps.nix {})))

#{pkgs, mkYarnPackage, fetchFromGitHub}: mkYarnPackage {
  #name = "ganache";
  #src = fetchFromGitHub {
    #owner = "trufflesuite";
    #repo = "ganache-cli";
    #rev = "v6.12.1";
    #sha256 = "1a4gsphv6spqplc1vhv6xn56kpa4nwyr6d21knz8b5bc7cmlhz7w";
  #};
  #preBuild = ''
    #exit 123
    #ls -alh
  #'';
#}
