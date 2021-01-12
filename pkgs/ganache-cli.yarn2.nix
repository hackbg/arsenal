pkgs: let

  yarn2nix = import ../yarn2nix {};
  nixLib   = yarn2nix.nixLib;

  srcSpec = {
    owner = "trufflesuite"; repo = "ganache-cli"; rev = "v6.12.1";
    sha256 = "1a4gsphv6spqplc1vhv6xn56kpa4nwyr6d21knz8b5bc7cmlhz7w";
  };
  src = pkgs.fetchFromGitHub srcSpec;
  # FIXME: fetchers return a string instead of a directory
  # which breaks removePrefixes and necessitates this ugly hack:
  srcFiltered = nixLib.removePrefixes [ "node_modules" ] ./ganache-cli;

  depsPkg = (pkgs.callPackage ./ganache-cli.deps.nix {});
  deps    = nixLib.buildNodeDeps depsPkg;

in
  nixLib.buildNodePackage
  (
    { 
      src = srcFiltered;
      postInstall = ''
        pwd
        ls -al
        cd $out
        pwd
        ls -al
        npm run build
      '';
    }
    //
    nixLib.callTemplate ./ganache-cli.template.nix deps
  )

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
