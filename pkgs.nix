options: let

  # Nixpkgs sources
  nixpkgs = <nixpkgs>; /*(builtins.fetchTarball {
    name   = "nixpkgs_nixos-unstable_2022-05-05";
    url    = "https://github.com/nixos/nixpkgs/archive/851130e9cdccce2fe6a78cbbf8c67d3afbdfdc85.tar.gz";
    sha256 = "0amfc0az00k1492m5swz0lbh1gimiij79aln4ajvx2jzmr6lbqdn";
  });*/

  # Overlays to add on top of Nixpkgs
  overlays = [ (import ./default.nix) ];

in import nixpkgs options
