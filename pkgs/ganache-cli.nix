{pkgs, mkYarnPackage, fetchFromGitHub}: mkYarnPackage {
  name = "ganache";
  src = fetchFromGitHub {
    owner = "trufflesuite";
    repo = "ganache-cli";
    rev = "v6.12.1";
    sha256 = "1a4gsphv6spqplc1vhv6xn56kpa4nwyr6d21knz8b5bc7cmlhz7w";
  };
  preBuild = ''
    exit 123
    ls -alh
  '';
}
