{  }:
  allDeps:
    {
      key = { name = "ganache-cli"; scope = ""; };
      version = "6.12.0";
      nodeBuildInputs = let
        a = allDeps;
      in [
        (a."node-loader@^0.6.0")
        (a."webpack-cli@3.3.12")
        (a."on-build-webpack@^0.1.0")
        (a."yargs@13.2.4")
        (a."ganache-core@2.13.1")
        (a."notp@2.0.3")
        (a."shebang-loader@0.0.1")
        (a."prepend-file@^1.3.1")
        (a."thirty-two@1.0.2")
        (a."@semantic-release/git@^9.0.0")
        (a."ethereumjs-util@6.2.1")
        (a."semantic-release@^17.1.1")
        (a."source-map-support@0.5.12")
        (a."webpack@4.43.0")
        ];
      meta = {
        license = {
          fullName = "MIT License";
          shortName = "mit";
          spdxId = "MIT";
          url = "https://spdx.org/licenses/MIT.html";
          };
        };
      }
