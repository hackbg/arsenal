{ fetchurl, fetchgit }:
  self:
    super:
      let
        registries = {
          yarn = n:
            v:
              "https://registry.yarnpkg.com/${n}/-/${n}-${v}.tgz";
          npm = n:
            v:
              "https://registry.npmjs.org/${n}/-/${n}-${v}.tgz";
          };
        nodeFilePackage = key:
          version:
            registry:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = fetchurl {
                      url = registry key version;
                      inherit sha1;
                      };
                    nodeBuildInputs = deps;
                    };
        nodeFileLocalPackage = key:
          version:
            path:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = builtins.path { inherit path; };
                    nodeBuildInputs = deps;
                    };
        nodeGitPackage = key:
          version:
            url:
              rev:
                sha256:
                  deps:
                    super._buildNodePackage {
                      inherit key version;
                      src = fetchgit { inherit url rev sha256; };
                      nodeBuildInputs = deps;
                      };
        identityRegistry = url:
          _:
            _:
              url;
        scopedName = scope:
          name:
            { inherit scope name; };
        ir = identityRegistry;
        l = nodeFileLocalPackage;
        f = nodeFilePackage;
        g = nodeGitPackage;
        n = registries.npm;
        y = registries.yarn;
        sc = scopedName;
        s = self;
      in {
        "@babel/code-frame@7.10.4" = f (sc "babel" "code-frame") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.10.4.tgz") "168da1a36e90da68ae8d49c0f1b48c7c6249213a" [
          (s."@babel/highlight@^7.10.4")
          ];
        "@babel/code-frame@^7.0.0" = s."@babel/code-frame@7.10.4";
        "@babel/helper-validator-identifier@7.10.4" = f (sc "babel" "helper-validator-identifier") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz") "a78c7a7251e01f616512d31b10adcf52ada5e0d2" [];
        "@babel/helper-validator-identifier@^7.10.4" = s."@babel/helper-validator-identifier@7.10.4";
        "@babel/highlight@7.10.4" = f (sc "babel" "highlight") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.10.4.tgz") "7d1bdfd65753538fabe6c38596cdb76d9ac60143" [
          (s."@babel/helper-validator-identifier@^7.10.4")
          (s."chalk@^2.0.0")
          (s."js-tokens@^4.0.0")
          ];
        "@babel/highlight@^7.10.4" = s."@babel/highlight@7.10.4";
        "@ethersproject/abi@5.0.0-beta.153" = f (sc "ethersproject" "abi") "5.0.0-beta.153" (ir "https://registry.yarnpkg.com/@ethersproject/abi/-/abi-5.0.0-beta.153.tgz") "43a37172b33794e4562999f6e2d555b7599a8eee" [
          (s."@ethersproject/address@>=5.0.0-beta.128")
          (s."@ethersproject/bignumber@>=5.0.0-beta.130")
          (s."@ethersproject/bytes@>=5.0.0-beta.129")
          (s."@ethersproject/constants@>=5.0.0-beta.128")
          (s."@ethersproject/hash@>=5.0.0-beta.128")
          (s."@ethersproject/keccak256@>=5.0.0-beta.127")
          (s."@ethersproject/logger@>=5.0.0-beta.129")
          (s."@ethersproject/properties@>=5.0.0-beta.131")
          (s."@ethersproject/strings@>=5.0.0-beta.130")
          ];
        "@ethersproject/address@5.0.5" = f (sc "ethersproject" "address") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/address/-/address-5.0.5.tgz") "2caa65f6b7125015395b1b54c985ee0b27059cc7" [
          (s."@ethersproject/bignumber@^5.0.7")
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/keccak256@^5.0.3")
          (s."@ethersproject/logger@^5.0.5")
          (s."@ethersproject/rlp@^5.0.3")
          (s."bn.js@^4.4.0")
          ];
        "@ethersproject/address@>=5.0.0-beta.128" = s."@ethersproject/address@5.0.5";
        "@ethersproject/address@^5.0.4" = s."@ethersproject/address@5.0.5";
        "@ethersproject/bignumber@5.0.8" = f (sc "ethersproject" "bignumber") "5.0.8" (ir "https://registry.yarnpkg.com/@ethersproject/bignumber/-/bignumber-5.0.8.tgz") "cee33bd8eb0266176def0d371b45274b1d2c4ec0" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/logger@^5.0.5")
          (s."bn.js@^4.4.0")
          ];
        "@ethersproject/bignumber@>=5.0.0-beta.130" = s."@ethersproject/bignumber@5.0.8";
        "@ethersproject/bignumber@^5.0.7" = s."@ethersproject/bignumber@5.0.8";
        "@ethersproject/bytes@5.0.5" = f (sc "ethersproject" "bytes") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/bytes/-/bytes-5.0.5.tgz") "688b70000e550de0c97a151a21f15b87d7f97d7c" [
          (s."@ethersproject/logger@^5.0.5")
          ];
        "@ethersproject/bytes@>=5.0.0-beta.129" = s."@ethersproject/bytes@5.0.5";
        "@ethersproject/bytes@^5.0.4" = s."@ethersproject/bytes@5.0.5";
        "@ethersproject/constants@5.0.5" = f (sc "ethersproject" "constants") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/constants/-/constants-5.0.5.tgz") "0ed19b002e8404bdf6d135234dc86a7d9bcf9b71" [
          (s."@ethersproject/bignumber@^5.0.7")
          ];
        "@ethersproject/constants@>=5.0.0-beta.128" = s."@ethersproject/constants@5.0.5";
        "@ethersproject/constants@^5.0.4" = s."@ethersproject/constants@5.0.5";
        "@ethersproject/hash@5.0.5" = f (sc "ethersproject" "hash") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/hash/-/hash-5.0.5.tgz") "e383ba2c7941834266fa6e2cf543d2b0c50a9d59" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/keccak256@^5.0.3")
          (s."@ethersproject/logger@^5.0.5")
          (s."@ethersproject/strings@^5.0.4")
          ];
        "@ethersproject/hash@>=5.0.0-beta.128" = s."@ethersproject/hash@5.0.5";
        "@ethersproject/keccak256@5.0.4" = f (sc "ethersproject" "keccak256") "5.0.4" (ir "https://registry.yarnpkg.com/@ethersproject/keccak256/-/keccak256-5.0.4.tgz") "36ca0a7d1ae2a272da5654cb886776d0c680ef3a" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."js-sha3@0.5.7")
          ];
        "@ethersproject/keccak256@>=5.0.0-beta.127" = s."@ethersproject/keccak256@5.0.4";
        "@ethersproject/keccak256@^5.0.3" = s."@ethersproject/keccak256@5.0.4";
        "@ethersproject/logger@5.0.6" = f (sc "ethersproject" "logger") "5.0.6" (ir "https://registry.yarnpkg.com/@ethersproject/logger/-/logger-5.0.6.tgz") "faa484203e86e08be9e07fef826afeef7183fe88" [];
        "@ethersproject/logger@>=5.0.0-beta.129" = s."@ethersproject/logger@5.0.6";
        "@ethersproject/logger@^5.0.5" = s."@ethersproject/logger@5.0.6";
        "@ethersproject/properties@5.0.4" = f (sc "ethersproject" "properties") "5.0.4" (ir "https://registry.yarnpkg.com/@ethersproject/properties/-/properties-5.0.4.tgz") "a67a1f5a52c30850b5062c861631e73d131f666e" [
          (s."@ethersproject/logger@^5.0.5")
          ];
        "@ethersproject/properties@>=5.0.0-beta.131" = s."@ethersproject/properties@5.0.4";
        "@ethersproject/properties@^5.0.3" = s."@ethersproject/properties@5.0.4";
        "@ethersproject/rlp@5.0.4" = f (sc "ethersproject" "rlp") "5.0.4" (ir "https://registry.yarnpkg.com/@ethersproject/rlp/-/rlp-5.0.4.tgz") "0090a0271e84ea803016a112a79f5cfd80271a77" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/logger@^5.0.5")
          ];
        "@ethersproject/rlp@^5.0.3" = s."@ethersproject/rlp@5.0.4";
        "@ethersproject/signing-key@5.0.5" = f (sc "ethersproject" "signing-key") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/signing-key/-/signing-key-5.0.5.tgz") "acfd06fc05a14180df7e027688bbd23fc4baf782" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/logger@^5.0.5")
          (s."@ethersproject/properties@^5.0.3")
          (s."elliptic@6.5.3")
          ];
        "@ethersproject/signing-key@^5.0.4" = s."@ethersproject/signing-key@5.0.5";
        "@ethersproject/strings@5.0.5" = f (sc "ethersproject" "strings") "5.0.5" (ir "https://registry.yarnpkg.com/@ethersproject/strings/-/strings-5.0.5.tgz") "ed7e99a282a02f40757691b04a24cd83f3752195" [
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/constants@^5.0.4")
          (s."@ethersproject/logger@^5.0.5")
          ];
        "@ethersproject/strings@>=5.0.0-beta.130" = s."@ethersproject/strings@5.0.5";
        "@ethersproject/strings@^5.0.4" = s."@ethersproject/strings@5.0.5";
        "@ethersproject/transactions@5.0.6" = f (sc "ethersproject" "transactions") "5.0.6" (ir "https://registry.yarnpkg.com/@ethersproject/transactions/-/transactions-5.0.6.tgz") "b8b27938be6e9ed671dbdd35fe98af8b14d0df7c" [
          (s."@ethersproject/address@^5.0.4")
          (s."@ethersproject/bignumber@^5.0.7")
          (s."@ethersproject/bytes@^5.0.4")
          (s."@ethersproject/constants@^5.0.4")
          (s."@ethersproject/keccak256@^5.0.3")
          (s."@ethersproject/logger@^5.0.5")
          (s."@ethersproject/properties@^5.0.3")
          (s."@ethersproject/rlp@^5.0.3")
          (s."@ethersproject/signing-key@^5.0.4")
          ];
        "@ethersproject/transactions@^5.0.0-beta.135" = s."@ethersproject/transactions@5.0.6";
        "@nodelib/fs.scandir@2.1.3" = f (sc "nodelib" "fs.scandir") "2.1.3" (ir "https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.3.tgz") "3a582bdb53804c6ba6d146579c46e52130cf4a3b" [
          (s."@nodelib/fs.stat@2.0.3")
          (s."run-parallel@^1.1.9")
          ];
        "@nodelib/fs.stat@2.0.3" = f (sc "nodelib" "fs.stat") "2.0.3" (ir "https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.3.tgz") "34dc5f4cabbc720f4e60f75a747e7ecd6c175bd3" [];
        "@nodelib/fs.stat@^2.0.2" = s."@nodelib/fs.stat@2.0.3";
        "@nodelib/fs.walk@1.2.4" = f (sc "nodelib" "fs.walk") "1.2.4" (ir "https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.4.tgz") "011b9202a70a6366e436ca5c065844528ab04976" [
          (s."@nodelib/fs.scandir@2.1.3")
          (s."fastq@^1.6.0")
          ];
        "@nodelib/fs.walk@^1.2.3" = s."@nodelib/fs.walk@1.2.4";
        "@octokit/auth-token@2.4.2" = f (sc "octokit" "auth-token") "2.4.2" (ir "https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-2.4.2.tgz") "10d0ae979b100fa6b72fa0e8e63e27e6d0dbff8a" [
          (s."@octokit/types@^5.0.0")
          ];
        "@octokit/auth-token@^2.4.0" = s."@octokit/auth-token@2.4.2";
        "@octokit/core@2.5.4" = f (sc "octokit" "core") "2.5.4" (ir "https://registry.yarnpkg.com/@octokit/core/-/core-2.5.4.tgz") "f7fbf8e4f86c5cc2497a8887ba2561ec8d358054" [
          (s."@octokit/auth-token@^2.4.0")
          (s."@octokit/graphql@^4.3.1")
          (s."@octokit/request@^5.4.0")
          (s."@octokit/types@^5.0.0")
          (s."before-after-hook@^2.1.0")
          (s."universal-user-agent@^5.0.0")
          ];
        "@octokit/core@^2.4.3" = s."@octokit/core@2.5.4";
        "@octokit/endpoint@6.0.6" = f (sc "octokit" "endpoint") "6.0.6" (ir "https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-6.0.6.tgz") "4f09f2b468976b444742a1d5069f6fa45826d999" [
          (s."@octokit/types@^5.0.0")
          (s."is-plain-object@^5.0.0")
          (s."universal-user-agent@^6.0.0")
          ];
        "@octokit/endpoint@^6.0.1" = s."@octokit/endpoint@6.0.6";
        "@octokit/graphql@4.5.6" = f (sc "octokit" "graphql") "4.5.6" (ir "https://registry.yarnpkg.com/@octokit/graphql/-/graphql-4.5.6.tgz") "708143ba15cf7c1879ed6188266e7f270be805d4" [
          (s."@octokit/request@^5.3.0")
          (s."@octokit/types@^5.0.0")
          (s."universal-user-agent@^6.0.0")
          ];
        "@octokit/graphql@^4.3.1" = s."@octokit/graphql@4.5.6";
        "@octokit/plugin-paginate-rest@2.4.0" = f (sc "octokit" "plugin-paginate-rest") "2.4.0" (ir "https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-2.4.0.tgz") "92f951ddc8a1cd505353fa07650752ca25ed7e93" [
          (s."@octokit/types@^5.5.0")
          ];
        "@octokit/plugin-paginate-rest@^2.2.0" = s."@octokit/plugin-paginate-rest@2.4.0";
        "@octokit/plugin-request-log@1.0.0" = f (sc "octokit" "plugin-request-log") "1.0.0" (ir "https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.0.tgz") "eef87a431300f6148c39a7f75f8cfeb218b2547e" [];
        "@octokit/plugin-request-log@^1.0.0" = s."@octokit/plugin-request-log@1.0.0";
        "@octokit/plugin-rest-endpoint-methods@3.17.0" = f (sc "octokit" "plugin-rest-endpoint-methods") "3.17.0" (ir "https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-3.17.0.tgz") "d8ba04eb883849dd98666c55bf49d8c9fe7be055" [
          (s."@octokit/types@^4.1.6")
          (s."deprecation@^2.3.1")
          ];
        "@octokit/request-error@2.0.2" = f (sc "octokit" "request-error") "2.0.2" (ir "https://registry.yarnpkg.com/@octokit/request-error/-/request-error-2.0.2.tgz") "0e76b83f5d8fdda1db99027ea5f617c2e6ba9ed0" [
          (s."@octokit/types@^5.0.1")
          (s."deprecation@^2.0.0")
          (s."once@^1.4.0")
          ];
        "@octokit/request-error@^2.0.0" = s."@octokit/request-error@2.0.2";
        "@octokit/request@5.4.9" = f (sc "octokit" "request") "5.4.9" (ir "https://registry.yarnpkg.com/@octokit/request/-/request-5.4.9.tgz") "0a46f11b82351b3416d3157261ad9b1558c43365" [
          (s."@octokit/endpoint@^6.0.1")
          (s."@octokit/request-error@^2.0.0")
          (s."@octokit/types@^5.0.0")
          (s."deprecation@^2.0.0")
          (s."is-plain-object@^5.0.0")
          (s."node-fetch@^2.6.1")
          (s."once@^1.4.0")
          (s."universal-user-agent@^6.0.0")
          ];
        "@octokit/request@^5.3.0" = s."@octokit/request@5.4.9";
        "@octokit/request@^5.4.0" = s."@octokit/request@5.4.9";
        "@octokit/rest@17.11.2" = f (sc "octokit" "rest") "17.11.2" (ir "https://registry.yarnpkg.com/@octokit/rest/-/rest-17.11.2.tgz") "f3dbd46f9f06361c646230fd0ef8598e59183ead" [
          (s."@octokit/core@^2.4.3")
          (s."@octokit/plugin-paginate-rest@^2.2.0")
          (s."@octokit/plugin-request-log@^1.0.0")
          (s."@octokit/plugin-rest-endpoint-methods@3.17.0")
          ];
        "@octokit/rest@^17.0.0" = s."@octokit/rest@17.11.2";
        "@octokit/types@4.1.10" = f (sc "octokit" "types") "4.1.10" (ir "https://registry.yarnpkg.com/@octokit/types/-/types-4.1.10.tgz") "e4029c11e2cc1335051775bc1600e7e740e4aca4" [
          (s."@types/node@>= 8")
          ];
        "@octokit/types@5.5.0" = f (sc "octokit" "types") "5.5.0" (ir "https://registry.yarnpkg.com/@octokit/types/-/types-5.5.0.tgz") "e5f06e8db21246ca102aa28444cdb13ae17a139b" [
          (s."@types/node@>= 8")
          ];
        "@octokit/types@^4.1.6" = s."@octokit/types@4.1.10";
        "@octokit/types@^5.0.0" = s."@octokit/types@5.5.0";
        "@octokit/types@^5.0.1" = s."@octokit/types@5.5.0";
        "@octokit/types@^5.5.0" = s."@octokit/types@5.5.0";
        "@semantic-release/commit-analyzer@8.0.1" = f (sc "semantic-release" "commit-analyzer") "8.0.1" (ir "https://registry.yarnpkg.com/@semantic-release/commit-analyzer/-/commit-analyzer-8.0.1.tgz") "5d2a37cd5a3312da0e3ac05b1ca348bf60b90bca" [
          (s."conventional-changelog-angular@^5.0.0")
          (s."conventional-commits-filter@^2.0.0")
          (s."conventional-commits-parser@^3.0.7")
          (s."debug@^4.0.0")
          (s."import-from@^3.0.0")
          (s."lodash@^4.17.4")
          (s."micromatch@^4.0.2")
          ];
        "@semantic-release/commit-analyzer@^8.0.0" = s."@semantic-release/commit-analyzer@8.0.1";
        "@semantic-release/error@2.2.0" = f (sc "semantic-release" "error") "2.2.0" (ir "https://registry.yarnpkg.com/@semantic-release/error/-/error-2.2.0.tgz") "ee9d5a09c9969eade1ec864776aeda5c5cddbbf0" [];
        "@semantic-release/error@^2.1.0" = s."@semantic-release/error@2.2.0";
        "@semantic-release/error@^2.2.0" = s."@semantic-release/error@2.2.0";
        "@semantic-release/git@9.0.0" = f (sc "semantic-release" "git") "9.0.0" (ir "https://registry.yarnpkg.com/@semantic-release/git/-/git-9.0.0.tgz") "304c4883c87d095b1faaae93300f1f1e0466e9a5" [
          (s."@semantic-release/error@^2.1.0")
          (s."aggregate-error@^3.0.0")
          (s."debug@^4.0.0")
          (s."dir-glob@^3.0.0")
          (s."execa@^4.0.0")
          (s."lodash@^4.17.4")
          (s."micromatch@^4.0.0")
          (s."p-reduce@^2.0.0")
          ];
        "@semantic-release/git@^9.0.0" = s."@semantic-release/git@9.0.0";
        "@semantic-release/github@7.1.1" = f (sc "semantic-release" "github") "7.1.1" (ir "https://registry.yarnpkg.com/@semantic-release/github/-/github-7.1.1.tgz") "e998aa9a9cd770838d9f27c64f060c2b686b9d95" [
          (s."@octokit/rest@^17.0.0")
          (s."@semantic-release/error@^2.2.0")
          (s."aggregate-error@^3.0.0")
          (s."bottleneck@^2.18.1")
          (s."debug@^4.0.0")
          (s."dir-glob@^3.0.0")
          (s."fs-extra@^9.0.0")
          (s."globby@^11.0.0")
          (s."http-proxy-agent@^4.0.0")
          (s."https-proxy-agent@^5.0.0")
          (s."issue-parser@^6.0.0")
          (s."lodash@^4.17.4")
          (s."mime@^2.4.3")
          (s."p-filter@^2.0.0")
          (s."p-retry@^4.0.0")
          (s."url-join@^4.0.0")
          ];
        "@semantic-release/github@^7.0.0" = s."@semantic-release/github@7.1.1";
        "@semantic-release/npm@7.0.6" = f (sc "semantic-release" "npm") "7.0.6" (ir "https://registry.yarnpkg.com/@semantic-release/npm/-/npm-7.0.6.tgz") "1301bd57d246eae048d7104a735467bb0829f3d8" [
          (s."@semantic-release/error@^2.2.0")
          (s."aggregate-error@^3.0.0")
          (s."execa@^4.0.0")
          (s."fs-extra@^9.0.0")
          (s."lodash@^4.17.15")
          (s."nerf-dart@^1.0.0")
          (s."normalize-url@^5.0.0")
          (s."npm@^6.13.0")
          (s."rc@^1.2.8")
          (s."read-pkg@^5.0.0")
          (s."registry-auth-token@^4.0.0")
          (s."semver@^7.1.2")
          (s."tempy@^0.5.0")
          ];
        "@semantic-release/npm@^7.0.0" = s."@semantic-release/npm@7.0.6";
        "@semantic-release/release-notes-generator@9.0.1" = f (sc "semantic-release" "release-notes-generator") "9.0.1" (ir "https://registry.yarnpkg.com/@semantic-release/release-notes-generator/-/release-notes-generator-9.0.1.tgz") "732d285d103064f2a64f08a32031551ebb4f918b" [
          (s."conventional-changelog-angular@^5.0.0")
          (s."conventional-changelog-writer@^4.0.0")
          (s."conventional-commits-filter@^2.0.0")
          (s."conventional-commits-parser@^3.0.0")
          (s."debug@^4.0.0")
          (s."get-stream@^5.0.0")
          (s."import-from@^3.0.0")
          (s."into-stream@^5.0.0")
          (s."lodash@^4.17.4")
          (s."read-pkg-up@^7.0.0")
          ];
        "@semantic-release/release-notes-generator@^9.0.0" = s."@semantic-release/release-notes-generator@9.0.1";
        "@sindresorhus/is@0.14.0" = f (sc "sindresorhus" "is") "0.14.0" (ir "https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz") "9fb3a3cf3132328151f353de4632e01e52102bea" [];
        "@sindresorhus/is@^0.14.0" = s."@sindresorhus/is@0.14.0";
        "@szmarczak/http-timer@1.1.2" = f (sc "szmarczak" "http-timer") "1.1.2" (ir "https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz") "b1665e2c461a2cd92f4c1bbf50d5454de0d4b421" [
          (s."defer-to-connect@^1.0.1")
          ];
        "@szmarczak/http-timer@^1.1.2" = s."@szmarczak/http-timer@1.1.2";
        "@tootallnate/once@1" = s."@tootallnate/once@1.1.2";
        "@tootallnate/once@1.1.2" = f (sc "tootallnate" "once") "1.1.2" (ir "https://registry.yarnpkg.com/@tootallnate/once/-/once-1.1.2.tgz") "ccb91445360179a04e7fe6aff78c00ffc1eeaf82" [];
        "@types/bn.js@4.11.6" = f (sc "types" "bn.js") "4.11.6" (ir "https://registry.yarnpkg.com/@types/bn.js/-/bn.js-4.11.6.tgz") "c306c70d9358aaea33cd4eda092a742b9505967c" [
          (s."@types/node@*")
          ];
        "@types/bn.js@^4.11.3" = s."@types/bn.js@4.11.6";
        "@types/bn.js@^4.11.5" = s."@types/bn.js@4.11.6";
        "@types/color-name@1.1.1" = f (sc "types" "color-name") "1.1.1" (ir "https://registry.yarnpkg.com/@types/color-name/-/color-name-1.1.1.tgz") "1c1261bbeaa10a8055bbc5d8ab84b7b2afc846a0" [];
        "@types/color-name@^1.1.1" = s."@types/color-name@1.1.1";
        "@types/minimist@1.2.0" = f (sc "types" "minimist") "1.2.0" (ir "https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.0.tgz") "69a23a3ad29caf0097f06eda59b361ee2f0639f6" [];
        "@types/minimist@^1.2.0" = s."@types/minimist@1.2.0";
        "@types/node@*" = s."@types/node@14.11.2";
        "@types/node@12.12.67" = f (sc "types" "node") "12.12.67" (ir "https://registry.yarnpkg.com/@types/node/-/node-12.12.67.tgz") "4f86badb292e822e3b13730a1f9713ed2377f789" [];
        "@types/node@14.11.2" = f (sc "types" "node") "14.11.2" (ir "https://registry.yarnpkg.com/@types/node/-/node-14.11.2.tgz") "2de1ed6670439387da1c9f549a2ade2b0a799256" [];
        "@types/node@>= 8" = s."@types/node@14.11.2";
        "@types/node@^12.12.6" = s."@types/node@12.12.67";
        "@types/normalize-package-data@2.4.0" = f (sc "types" "normalize-package-data") "2.4.0" (ir "https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.0.tgz") "e486d0d97396d79beedd0a6e33f4534ff6b4973e" [];
        "@types/normalize-package-data@^2.4.0" = s."@types/normalize-package-data@2.4.0";
        "@types/parse-json@4.0.0" = f (sc "types" "parse-json") "4.0.0" (ir "https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz") "2f8bb441434d163b35fb8ffdccd7138927ffb8c0" [];
        "@types/parse-json@^4.0.0" = s."@types/parse-json@4.0.0";
        "@types/pbkdf2@3.1.0" = f (sc "types" "pbkdf2") "3.1.0" (ir "https://registry.yarnpkg.com/@types/pbkdf2/-/pbkdf2-3.1.0.tgz") "039a0e9b67da0cdc4ee5dab865caa6b267bb66b1" [
          (s."@types/node@*")
          ];
        "@types/pbkdf2@^3.0.0" = s."@types/pbkdf2@3.1.0";
        "@types/retry@0.12.0" = f (sc "types" "retry") "0.12.0" (ir "https://registry.yarnpkg.com/@types/retry/-/retry-0.12.0.tgz") "2b35eccfcee7d38cd72ad99232fbd58bffb3c84d" [];
        "@types/retry@^0.12.0" = s."@types/retry@0.12.0";
        "@types/secp256k1@4.0.1" = f (sc "types" "secp256k1") "4.0.1" (ir "https://registry.yarnpkg.com/@types/secp256k1/-/secp256k1-4.0.1.tgz") "fb3aa61a1848ad97d7425ff9dcba784549fca5a4" [
          (s."@types/node@*")
          ];
        "@types/secp256k1@^4.0.1" = s."@types/secp256k1@4.0.1";
        "@webassemblyjs/ast@1.9.0" = f (sc "webassemblyjs" "ast") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.9.0.tgz") "bd850604b4042459a5a41cd7d338cbed695ed964" [
          (s."@webassemblyjs/helper-module-context@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/wast-parser@1.9.0")
          ];
        "@webassemblyjs/floating-point-hex-parser@1.9.0" = f (sc "webassemblyjs" "floating-point-hex-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz") "3c3d3b271bddfc84deb00f71344438311d52ffb4" [];
        "@webassemblyjs/helper-api-error@1.9.0" = f (sc "webassemblyjs" "helper-api-error") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz") "203f676e333b96c9da2eeab3ccef33c45928b6a2" [];
        "@webassemblyjs/helper-buffer@1.9.0" = f (sc "webassemblyjs" "helper-buffer") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz") "a1442d269c5feb23fcbc9ef759dac3547f29de00" [];
        "@webassemblyjs/helper-code-frame@1.9.0" = f (sc "webassemblyjs" "helper-code-frame") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz") "647f8892cd2043a82ac0c8c5e75c36f1d9159f27" [
          (s."@webassemblyjs/wast-printer@1.9.0")
          ];
        "@webassemblyjs/helper-fsm@1.9.0" = f (sc "webassemblyjs" "helper-fsm") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz") "c05256b71244214671f4b08ec108ad63b70eddb8" [];
        "@webassemblyjs/helper-module-context@1.9.0" = f (sc "webassemblyjs" "helper-module-context") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz") "25d8884b76839871a08a6c6f806c3979ef712f07" [];
        "@webassemblyjs/helper-wasm-bytecode@1.9.0" = f (sc "webassemblyjs" "helper-wasm-bytecode") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz") "4fed8beac9b8c14f8c58b70d124d549dd1fe5790" [];
        "@webassemblyjs/helper-wasm-section@1.9.0" = f (sc "webassemblyjs" "helper-wasm-section") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz") "5a4138d5a6292ba18b04c5ae49717e4167965346" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          ];
        "@webassemblyjs/ieee754@1.9.0" = f (sc "webassemblyjs" "ieee754") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz") "15c7a0fbaae83fb26143bbacf6d6df1702ad39e4" [
          (s."@xtuc/ieee754@^1.2.0")
          ];
        "@webassemblyjs/leb128@1.9.0" = f (sc "webassemblyjs" "leb128") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.9.0.tgz") "f19ca0b76a6dc55623a09cffa769e838fa1e1c95" [
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/utf8@1.9.0" = f (sc "webassemblyjs" "utf8") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.9.0.tgz") "04d33b636f78e6a6813227e82402f7637b6229ab" [];
        "@webassemblyjs/wasm-edit@1.9.0" = f (sc "webassemblyjs" "wasm-edit") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz") "3fe6d79d3f0f922183aa86002c42dd256cfee9cf" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/helper-wasm-section@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          (s."@webassemblyjs/wasm-opt@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          (s."@webassemblyjs/wast-printer@1.9.0")
          ];
        "@webassemblyjs/wasm-gen@1.9.0" = f (sc "webassemblyjs" "wasm-gen") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz") "50bc70ec68ded8e2763b01a1418bf43491a7a49c" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/ieee754@1.9.0")
          (s."@webassemblyjs/leb128@1.9.0")
          (s."@webassemblyjs/utf8@1.9.0")
          ];
        "@webassemblyjs/wasm-opt@1.9.0" = f (sc "webassemblyjs" "wasm-opt") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz") "2211181e5b31326443cc8112eb9f0b9028721a61" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          ];
        "@webassemblyjs/wasm-parser@1.9.0" = f (sc "webassemblyjs" "wasm-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz") "9d48e44826df4a6598294aa6c87469d642fff65e" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-api-error@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/ieee754@1.9.0")
          (s."@webassemblyjs/leb128@1.9.0")
          (s."@webassemblyjs/utf8@1.9.0")
          ];
        "@webassemblyjs/wast-parser@1.9.0" = f (sc "webassemblyjs" "wast-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz") "3031115d79ac5bd261556cecc3fa90a3ef451914" [
          (s."@webassemblyjs/floating-point-hex-parser@1.9.0")
          (s."@webassemblyjs/helper-api-error@1.9.0")
          (s."@webassemblyjs/helper-code-frame@1.9.0")
          (s."@webassemblyjs/helper-fsm@1.9.0")
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/wast-printer@1.9.0" = f (sc "webassemblyjs" "wast-printer") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz") "4935d54c85fef637b00ce9f52377451d00d47899" [
          (s."@xtuc/long@4.2.2")
          ];
        "@xtuc/ieee754@1.2.0" = f (sc "xtuc" "ieee754") "1.2.0" (ir "https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz") "eef014a3145ae477a1cbc00cd1e552336dceb790" [];
        "@xtuc/ieee754@^1.2.0" = s."@xtuc/ieee754@1.2.0";
        "@xtuc/long@4.2.2" = f (sc "xtuc" "long") "4.2.2" (ir "https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz") "d291c6a4e97989b5c61d9acf396ae4fe133a718d" [];
        "@yarnpkg/lockfile@1.1.0" = f (sc "yarnpkg" "lockfile") "1.1.0" (ir "https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.1.0.tgz") "e77a97fbd345b76d83245edcd17d393b1b41fb31" [];
        "@yarnpkg/lockfile@^1.1.0" = s."@yarnpkg/lockfile@1.1.0";
        "JSONStream@1.3.5" = f "JSONStream" "1.3.5" y "3208c1f08d3a4d99261ab64f92302bc15e111ca0" [
          (s."jsonparse@^1.2.0")
          (s."through@>=2.2.7 <3")
          ];
        "JSONStream@^1.0.4" = s."JSONStream@1.3.5";
        "JSONStream@^1.3.4" = s."JSONStream@1.3.5";
        "JSONStream@^1.3.5" = s."JSONStream@1.3.5";
        "abbrev@1" = s."abbrev@1.1.1";
        "abbrev@1.1.1" = f "abbrev" "1.1.1" y "f8f2c887ad10bf67f634f005b6987fed3179aac8" [];
        "abbrev@~1.1.1" = s."abbrev@1.1.1";
        "abstract-leveldown@2.6.3" = f "abstract-leveldown" "2.6.3" y "1c5e8c6a5ef965ae8c35dfb3a8770c476b82c4b8" [
          (s."xtend@~4.0.0")
          ];
        "abstract-leveldown@2.7.2" = f "abstract-leveldown" "2.7.2" y "87a44d7ebebc341d59665204834c8b7e0932cc93" [
          (s."xtend@~4.0.0")
          ];
        "abstract-leveldown@3.0.0" = f "abstract-leveldown" "3.0.0" y "5cb89f958a44f526779d740d1440e743e0c30a57" [
          (s."xtend@~4.0.0")
          ];
        "abstract-leveldown@5.0.0" = f "abstract-leveldown" "5.0.0" y "f7128e1f86ccabf7d2893077ce5d06d798e386c6" [
          (s."xtend@~4.0.0")
          ];
        "abstract-leveldown@^2.4.1" = s."abstract-leveldown@2.7.2";
        "abstract-leveldown@^5.0.0" = s."abstract-leveldown@5.0.0";
        "abstract-leveldown@~2.6.0" = s."abstract-leveldown@2.6.3";
        "abstract-leveldown@~2.7.1" = s."abstract-leveldown@2.7.2";
        "abstract-leveldown@~5.0.0" = s."abstract-leveldown@5.0.0";
        "accepts@1.3.7" = f "accepts" "1.3.7" y "531bc726517a3b2b41f850021c6cc15eaab507cd" [
          (s."mime-types@~2.1.24")
          (s."negotiator@0.6.2")
          ];
        "accepts@~1.3.7" = s."accepts@1.3.7";
        "acorn@6.4.1" = f "acorn" "6.4.1" y "531e58ba3f51b9dacb9a6646ca4debf5b14ca474" [];
        "acorn@^6.4.1" = s."acorn@6.4.1";
        "aes-js@3.1.2" = f "aes-js" "3.1.2" y "db9aabde85d5caabbfc0d4f2a4446960f627146a" [];
        "aes-js@^3.1.1" = s."aes-js@3.1.2";
        "agent-base@4" = s."agent-base@4.3.0";
        "agent-base@4.2.1" = f "agent-base" "4.2.1" y "d89e5999f797875674c07d87f260fc41e83e8ca9" [
          (s."es6-promisify@^5.0.0")
          ];
        "agent-base@4.3.0" = f "agent-base" "4.3.0" y "8165f01c436009bccad0b1d122f05ed770efc6ee" [
          (s."es6-promisify@^5.0.0")
          ];
        "agent-base@6" = s."agent-base@6.0.1";
        "agent-base@6.0.1" = f "agent-base" "6.0.1" y "808007e4e5867decb0ab6ab2f928fbdb5a596db4" [
          (s."debug@4")
          ];
        "agent-base@^4.3.0" = s."agent-base@4.3.0";
        "agent-base@~4.2.1" = s."agent-base@4.2.1";
        "agentkeepalive@3.5.2" = f "agentkeepalive" "3.5.2" y "a113924dd3fa24a0bc3b78108c450c2abee00f67" [
          (s."humanize-ms@^1.2.1")
          ];
        "agentkeepalive@^3.4.1" = s."agentkeepalive@3.5.2";
        "aggregate-error@3.1.0" = f "aggregate-error" "3.1.0" y "92670ff50f5359bdb7a3e0d40d0ec30c5737687a" [
          (s."clean-stack@^2.0.0")
          (s."indent-string@^4.0.0")
          ];
        "aggregate-error@^3.0.0" = s."aggregate-error@3.1.0";
        "ajv-errors@1.0.1" = f "ajv-errors" "1.0.1" y "f35986aceb91afadec4102fbd85014950cefa64d" [];
        "ajv-errors@^1.0.0" = s."ajv-errors@1.0.1";
        "ajv-keywords@3.5.2" = f "ajv-keywords" "3.5.2" y "31f29da5ab6e00d1c2d329acf7b5929614d5014d" [];
        "ajv-keywords@^3.1.0" = s."ajv-keywords@3.5.2";
        "ajv-keywords@^3.4.1" = s."ajv-keywords@3.5.2";
        "ajv@5.5.2" = f "ajv" "5.5.2" y "73b5eeca3fab653e3d3f9422b341ad42205dc965" [
          (s."co@^4.6.0")
          (s."fast-deep-equal@^1.0.0")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.3.0")
          ];
        "ajv@6.12.5" = f "ajv" "6.12.5" y "19b0e8bae8f476e5ba666300387775fb1a00a4da" [
          (s."fast-deep-equal@^3.1.1")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.4.1")
          (s."uri-js@^4.2.2")
          ];
        "ajv@^5.3.0" = s."ajv@5.5.2";
        "ajv@^6.1.0" = s."ajv@6.12.5";
        "ajv@^6.10.2" = s."ajv@6.12.5";
        "ajv@^6.12.3" = s."ajv@6.12.5";
        "ansi-align@2.0.0" = f "ansi-align" "2.0.0" y "c36aeccba563b89ceb556f3690f0b1d9e3547f7f" [
          (s."string-width@^2.0.0")
          ];
        "ansi-align@^2.0.0" = s."ansi-align@2.0.0";
        "ansi-escapes@4.3.1" = f "ansi-escapes" "4.3.1" y "a5c47cc43181f1f38ffd7076837700d395522a61" [
          (s."type-fest@^0.11.0")
          ];
        "ansi-escapes@^4.3.1" = s."ansi-escapes@4.3.1";
        "ansi-regex@2.1.1" = f "ansi-regex" "2.1.1" y "c3b33ab5ee360d86e0e628f0468ae7ef27d654df" [];
        "ansi-regex@3.0.0" = f "ansi-regex" "3.0.0" y "ed0317c322064f79466c02966bddb605ab37d998" [];
        "ansi-regex@4.1.0" = f "ansi-regex" "4.1.0" y "8b9f8f08cf1acb843756a839ca8c7e3168c51997" [];
        "ansi-regex@5.0.0" = f "ansi-regex" "5.0.0" y "388539f55179bf39339c81af30a654d69f87cb75" [];
        "ansi-regex@^2.0.0" = s."ansi-regex@2.1.1";
        "ansi-regex@^3.0.0" = s."ansi-regex@3.0.0";
        "ansi-regex@^4.1.0" = s."ansi-regex@4.1.0";
        "ansi-regex@^5.0.0" = s."ansi-regex@5.0.0";
        "ansi-styles@2.2.1" = f "ansi-styles" "2.2.1" y "b432dd3358b634cf75e1e4664368240533c1ddbe" [];
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@4.2.1" = f "ansi-styles" "4.2.1" y "90ae75c424d008d2624c5bf29ead3177ebfcf359" [
          (s."@types/color-name@^1.1.1")
          (s."color-convert@^2.0.1")
          ];
        "ansi-styles@^2.2.1" = s."ansi-styles@2.2.1";
        "ansi-styles@^3.2.0" = s."ansi-styles@3.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "ansi-styles@^4.0.0" = s."ansi-styles@4.2.1";
        "ansi-styles@^4.1.0" = s."ansi-styles@4.2.1";
        "ansicolors@0.3.2" = f "ansicolors" "0.3.2" y "665597de86a9ffe3aa9bfbe6cae5c6ea426b4979" [];
        "ansicolors@~0.3.2" = s."ansicolors@0.3.2";
        "ansistyles@0.1.3" = f "ansistyles" "0.1.3" y "5de60415bda071bb37127854c864f41b23254539" [];
        "ansistyles@~0.1.3" = s."ansistyles@0.1.3";
        "anymatch@2.0.0" = f "anymatch" "2.0.0" y "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb" [
          (s."micromatch@^3.1.4")
          (s."normalize-path@^2.1.1")
          ];
        "anymatch@3.1.1" = f "anymatch" "3.1.1" y "c55ecf02185e2469259399310c173ce31233b142" [
          (s."normalize-path@^3.0.0")
          (s."picomatch@^2.0.4")
          ];
        "anymatch@^2.0.0" = s."anymatch@2.0.0";
        "anymatch@~3.1.1" = s."anymatch@3.1.1";
        "aproba@1.2.0" = f "aproba" "1.2.0" y "6802e6264efd18c790a1b0d517f0f2627bf2c94a" [];
        "aproba@2.0.0" = f "aproba" "2.0.0" y "52520b8ae5b569215b354efc0caa3fe1e45a8adc" [];
        "aproba@^1.0.3" = s."aproba@1.2.0";
        "aproba@^1.1.1" = s."aproba@1.2.0";
        "aproba@^1.1.2" = s."aproba@1.2.0";
        "aproba@^1.1.2 || 2" = s."aproba@2.0.0";
        "aproba@^2.0.0" = s."aproba@2.0.0";
        "archy@1.0.0" = f "archy" "1.0.0" y "f9c8c13757cc1dd7bc379ac77b2c62a5c2868c40" [];
        "archy@~1.0.0" = s."archy@1.0.0";
        "are-we-there-yet@1.1.4" = f "are-we-there-yet" "1.1.4" y "bb5dca382bb94f05e15194373d16fd3ba1ca110d" [
          (s."delegates@^1.0.0")
          (s."readable-stream@^2.0.6")
          ];
        "are-we-there-yet@~1.1.2" = s."are-we-there-yet@1.1.4";
        "argv-formatter@1.0.0" = f "argv-formatter" "1.0.0" y "a0ca0cbc29a5b73e836eebe1cbf6c5e0e4eb82f9" [];
        "argv-formatter@~1.0.0" = s."argv-formatter@1.0.0";
        "arr-diff@4.0.0" = f "arr-diff" "4.0.0" y "d6461074febfec71e7e15235761a329a5dc7c520" [];
        "arr-diff@^4.0.0" = s."arr-diff@4.0.0";
        "arr-flatten@1.1.0" = f "arr-flatten" "1.1.0" y "36048bbff4e7b47e136644316c99669ea5ae91f1" [];
        "arr-flatten@^1.1.0" = s."arr-flatten@1.1.0";
        "arr-union@3.1.0" = f "arr-union" "3.1.0" y "e39b09aea9def866a8f206e288af63919bae39c4" [];
        "arr-union@^3.1.0" = s."arr-union@3.1.0";
        "array-flatten@1.1.1" = f "array-flatten" "1.1.1" y "9a5f699051b1e7073328f2a008968b64ea2955d2" [];
        "array-ify@1.0.0" = f "array-ify" "1.0.0" y "9e528762b4a9066ad163a6962a364418e9626ece" [];
        "array-ify@^1.0.0" = s."array-ify@1.0.0";
        "array-union@2.1.0" = f "array-union" "2.1.0" y "b798420adbeb1de828d84acd8a2e23d3efe85e8d" [];
        "array-union@^2.1.0" = s."array-union@2.1.0";
        "array-unique@0.3.2" = f "array-unique" "0.3.2" y "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428" [];
        "array-unique@^0.3.2" = s."array-unique@0.3.2";
        "arrify@1.0.1" = f "arrify" "1.0.1" y "898508da2226f380df904728456849c1501a4b0d" [];
        "arrify@^1.0.1" = s."arrify@1.0.1";
        "asap@2.0.6" = f "asap" "2.0.6" y "e50347611d7e690943208bbdafebcbc2fb866d46" [];
        "asap@^2.0.0" = s."asap@2.0.6";
        "asn1.js@5.4.1" = f "asn1.js" "5.4.1" y "11a980b84ebb91781ce35b0fdc2ee294e3783f07" [
          (s."bn.js@^4.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          (s."safer-buffer@^2.1.0")
          ];
        "asn1.js@^5.2.0" = s."asn1.js@5.4.1";
        "asn1@0.2.4" = f "asn1" "0.2.4" y "8d2475dfab553bb33e77b54e59e880bb8ce23136" [
          (s."safer-buffer@~2.1.0")
          ];
        "asn1@~0.2.3" = s."asn1@0.2.4";
        "assert-plus@1.0.0" = f "assert-plus" "1.0.0" y "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525" [];
        "assert-plus@^1.0.0" = s."assert-plus@1.0.0";
        "assert@1.5.0" = f "assert" "1.5.0" y "55c109aaf6e0aefdb3dc4b71240c70bf574b18eb" [
          (s."object-assign@^4.1.1")
          (s."util@0.10.3")
          ];
        "assert@^1.1.1" = s."assert@1.5.0";
        "assign-symbols@1.0.0" = f "assign-symbols" "1.0.0" y "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367" [];
        "assign-symbols@^1.0.0" = s."assign-symbols@1.0.0";
        "async-each@1.0.3" = f "async-each" "1.0.3" y "b727dbf87d7651602f06f4d4ac387f47d91b0cbf" [];
        "async-each@^1.0.1" = s."async-each@1.0.3";
        "async-eventemitter@0.2.4" = f "async-eventemitter" "0.2.4" y "f5e7c8ca7d3e46aab9ec40a292baf686a0bafaca" [
          (s."async@^2.4.0")
          ];
        "async-eventemitter@^0.2.2" = s."async-eventemitter@0.2.4";
        "async-limiter@1.0.1" = f "async-limiter" "1.0.1" y "dd379e94f0db8310b08291f9d64c3209766617fd" [];
        "async-limiter@~1.0.0" = s."async-limiter@1.0.1";
        "async@1.5.2" = f "async" "1.5.2" y "ec6a61ae56480c0c3cb241c95618e20892f9672a" [];
        "async@2.6.2" = f "async" "2.6.2" y "18330ea7e6e313887f5d2f2a904bac6fe4dd5381" [
          (s."lodash@^4.17.11")
          ];
        "async@^1.4.2" = s."async@1.5.2";
        "async@^2.0.1" = s."async@2.6.2";
        "async@^2.1.2" = s."async@2.6.2";
        "async@^2.4.0" = s."async@2.6.2";
        "async@^2.5.0" = s."async@2.6.2";
        "async@^2.6.1" = s."async@2.6.2";
        "asynckit@0.4.0" = f "asynckit" "0.4.0" y "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79" [];
        "asynckit@^0.4.0" = s."asynckit@0.4.0";
        "at-least-node@1.0.0" = f "at-least-node" "1.0.0" y "602cd4b46e844ad4effc92a8011a3c46e0238dc2" [];
        "at-least-node@^1.0.0" = s."at-least-node@1.0.0";
        "atob@2.1.2" = f "atob" "2.1.2" y "6d9517eb9e030d2436666651e86bd9f6f13533c9" [];
        "atob@^2.1.2" = s."atob@2.1.2";
        "aws-sign2@0.7.0" = f "aws-sign2" "0.7.0" y "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8" [];
        "aws-sign2@~0.7.0" = s."aws-sign2@0.7.0";
        "aws4@1.8.0" = f "aws4" "1.8.0" y "f0e003d9ca9e7f59c7a508945d7b2ef9a04a542f" [];
        "aws4@^1.8.0" = s."aws4@1.8.0";
        "babel-code-frame@6.26.0" = f "babel-code-frame" "6.26.0" y "63fd43f7dc1e3bb7ce35947db8fe369a3f58c74b" [
          (s."chalk@^1.1.3")
          (s."esutils@^2.0.2")
          (s."js-tokens@^3.0.2")
          ];
        "babel-code-frame@^6.26.0" = s."babel-code-frame@6.26.0";
        "babel-core@6.26.3" = f "babel-core" "6.26.3" y "b2e2f09e342d0f0c88e2f02e067794125e75c207" [
          (s."babel-code-frame@^6.26.0")
          (s."babel-generator@^6.26.0")
          (s."babel-helpers@^6.24.1")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-template@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."convert-source-map@^1.5.1")
          (s."debug@^2.6.9")
          (s."json5@^0.5.1")
          (s."lodash@^4.17.4")
          (s."minimatch@^3.0.4")
          (s."path-is-absolute@^1.0.1")
          (s."private@^0.1.8")
          (s."slash@^1.0.0")
          (s."source-map@^0.5.7")
          ];
        "babel-core@^6.0.14" = s."babel-core@6.26.3";
        "babel-core@^6.26.0" = s."babel-core@6.26.3";
        "babel-generator@6.26.1" = f "babel-generator" "6.26.1" y "1844408d3b8f0d35a404ea7ac180f087a601bd90" [
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."detect-indent@^4.0.0")
          (s."jsesc@^1.3.0")
          (s."lodash@^4.17.4")
          (s."source-map@^0.5.7")
          (s."trim-right@^1.0.1")
          ];
        "babel-generator@^6.26.0" = s."babel-generator@6.26.1";
        "babel-helper-builder-binary-assignment-operator-visitor@6.24.1" = f "babel-helper-builder-binary-assignment-operator-visitor" "6.24.1" y "cce4517ada356f4220bcae8a02c2b346f9a56664" [
          (s."babel-helper-explode-assignable-expression@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-builder-binary-assignment-operator-visitor@^6.24.1" = s."babel-helper-builder-binary-assignment-operator-visitor@6.24.1";
        "babel-helper-call-delegate@6.24.1" = f "babel-helper-call-delegate" "6.24.1" y "ece6aacddc76e41c3461f88bfc575bd0daa2df8d" [
          (s."babel-helper-hoist-variables@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-call-delegate@^6.24.1" = s."babel-helper-call-delegate@6.24.1";
        "babel-helper-define-map@6.26.0" = f "babel-helper-define-map" "6.26.0" y "a5f56dab41a25f97ecb498c7ebaca9819f95be5f" [
          (s."babel-helper-function-name@^6.24.1")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."lodash@^4.17.4")
          ];
        "babel-helper-define-map@^6.24.1" = s."babel-helper-define-map@6.26.0";
        "babel-helper-explode-assignable-expression@6.24.1" = f "babel-helper-explode-assignable-expression" "6.24.1" y "f25b82cf7dc10433c55f70592d5746400ac22caa" [
          (s."babel-runtime@^6.22.0")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-explode-assignable-expression@^6.24.1" = s."babel-helper-explode-assignable-expression@6.24.1";
        "babel-helper-function-name@6.24.1" = f "babel-helper-function-name" "6.24.1" y "d3475b8c03ed98242a25b48351ab18399d3580a9" [
          (s."babel-helper-get-function-arity@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-function-name@^6.24.1" = s."babel-helper-function-name@6.24.1";
        "babel-helper-get-function-arity@6.24.1" = f "babel-helper-get-function-arity" "6.24.1" y "8f7782aa93407c41d3aa50908f89b031b1b6853d" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-get-function-arity@^6.24.1" = s."babel-helper-get-function-arity@6.24.1";
        "babel-helper-hoist-variables@6.24.1" = f "babel-helper-hoist-variables" "6.24.1" y "1ecb27689c9d25513eadbc9914a73f5408be7a76" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-hoist-variables@^6.24.1" = s."babel-helper-hoist-variables@6.24.1";
        "babel-helper-optimise-call-expression@6.24.1" = f "babel-helper-optimise-call-expression" "6.24.1" y "f7a13427ba9f73f8f4fa993c54a97882d1244257" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-optimise-call-expression@^6.24.1" = s."babel-helper-optimise-call-expression@6.24.1";
        "babel-helper-regex@6.26.0" = f "babel-helper-regex" "6.26.0" y "325c59f902f82f24b74faceed0363954f6495e72" [
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."lodash@^4.17.4")
          ];
        "babel-helper-regex@^6.24.1" = s."babel-helper-regex@6.26.0";
        "babel-helper-remap-async-to-generator@6.24.1" = f "babel-helper-remap-async-to-generator" "6.24.1" y "5ec581827ad723fecdd381f1c928390676e4551b" [
          (s."babel-helper-function-name@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-remap-async-to-generator@^6.24.1" = s."babel-helper-remap-async-to-generator@6.24.1";
        "babel-helper-replace-supers@6.24.1" = f "babel-helper-replace-supers" "6.24.1" y "bf6dbfe43938d17369a213ca8a8bf74b6a90ab1a" [
          (s."babel-helper-optimise-call-expression@^6.24.1")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-helper-replace-supers@^6.24.1" = s."babel-helper-replace-supers@6.24.1";
        "babel-helpers@6.24.1" = f "babel-helpers" "6.24.1" y "3471de9caec388e5c850e597e58a26ddf37602b2" [
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-helpers@^6.24.1" = s."babel-helpers@6.24.1";
        "babel-messages@6.23.0" = f "babel-messages" "6.23.0" y "f3cdf4703858035b2a2951c6ec5edf6c62f2630e" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-messages@^6.23.0" = s."babel-messages@6.23.0";
        "babel-plugin-check-es2015-constants@6.22.0" = f "babel-plugin-check-es2015-constants" "6.22.0" y "35157b101426fd2ffd3da3f75c7d1e91835bbf8a" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-check-es2015-constants@^6.22.0" = s."babel-plugin-check-es2015-constants@6.22.0";
        "babel-plugin-syntax-async-functions@6.13.0" = f "babel-plugin-syntax-async-functions" "6.13.0" y "cad9cad1191b5ad634bf30ae0872391e0647be95" [];
        "babel-plugin-syntax-async-functions@^6.8.0" = s."babel-plugin-syntax-async-functions@6.13.0";
        "babel-plugin-syntax-exponentiation-operator@6.13.0" = f "babel-plugin-syntax-exponentiation-operator" "6.13.0" y "9ee7e8337290da95288201a6a57f4170317830de" [];
        "babel-plugin-syntax-exponentiation-operator@^6.8.0" = s."babel-plugin-syntax-exponentiation-operator@6.13.0";
        "babel-plugin-syntax-trailing-function-commas@6.22.0" = f "babel-plugin-syntax-trailing-function-commas" "6.22.0" y "ba0360937f8d06e40180a43fe0d5616fff532cf3" [];
        "babel-plugin-syntax-trailing-function-commas@^6.22.0" = s."babel-plugin-syntax-trailing-function-commas@6.22.0";
        "babel-plugin-transform-async-to-generator@6.24.1" = f "babel-plugin-transform-async-to-generator" "6.24.1" y "6536e378aff6cb1d5517ac0e40eb3e9fc8d08761" [
          (s."babel-helper-remap-async-to-generator@^6.24.1")
          (s."babel-plugin-syntax-async-functions@^6.8.0")
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-async-to-generator@^6.22.0" = s."babel-plugin-transform-async-to-generator@6.24.1";
        "babel-plugin-transform-es2015-arrow-functions@6.22.0" = f "babel-plugin-transform-es2015-arrow-functions" "6.22.0" y "452692cb711d5f79dc7f85e440ce41b9f244d221" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-arrow-functions@^6.22.0" = s."babel-plugin-transform-es2015-arrow-functions@6.22.0";
        "babel-plugin-transform-es2015-block-scoped-functions@6.22.0" = f "babel-plugin-transform-es2015-block-scoped-functions" "6.22.0" y "bbc51b49f964d70cb8d8e0b94e820246ce3a6141" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-block-scoped-functions@^6.22.0" = s."babel-plugin-transform-es2015-block-scoped-functions@6.22.0";
        "babel-plugin-transform-es2015-block-scoping@6.26.0" = f "babel-plugin-transform-es2015-block-scoping" "6.26.0" y "d70f5299c1308d05c12f463813b0a09e73b1895f" [
          (s."babel-runtime@^6.26.0")
          (s."babel-template@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."lodash@^4.17.4")
          ];
        "babel-plugin-transform-es2015-block-scoping@^6.23.0" = s."babel-plugin-transform-es2015-block-scoping@6.26.0";
        "babel-plugin-transform-es2015-classes@6.24.1" = f "babel-plugin-transform-es2015-classes" "6.24.1" y "5a4c58a50c9c9461e564b4b2a3bfabc97a2584db" [
          (s."babel-helper-define-map@^6.24.1")
          (s."babel-helper-function-name@^6.24.1")
          (s."babel-helper-optimise-call-expression@^6.24.1")
          (s."babel-helper-replace-supers@^6.24.1")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-classes@^6.23.0" = s."babel-plugin-transform-es2015-classes@6.24.1";
        "babel-plugin-transform-es2015-computed-properties@6.24.1" = f "babel-plugin-transform-es2015-computed-properties" "6.24.1" y "6fe2a8d16895d5634f4cd999b6d3480a308159b3" [
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-plugin-transform-es2015-computed-properties@^6.22.0" = s."babel-plugin-transform-es2015-computed-properties@6.24.1";
        "babel-plugin-transform-es2015-destructuring@6.23.0" = f "babel-plugin-transform-es2015-destructuring" "6.23.0" y "997bb1f1ab967f682d2b0876fe358d60e765c56d" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-destructuring@^6.23.0" = s."babel-plugin-transform-es2015-destructuring@6.23.0";
        "babel-plugin-transform-es2015-duplicate-keys@6.24.1" = f "babel-plugin-transform-es2015-duplicate-keys" "6.24.1" y "73eb3d310ca969e3ef9ec91c53741a6f1576423e" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-duplicate-keys@^6.22.0" = s."babel-plugin-transform-es2015-duplicate-keys@6.24.1";
        "babel-plugin-transform-es2015-for-of@6.23.0" = f "babel-plugin-transform-es2015-for-of" "6.23.0" y "f47c95b2b613df1d3ecc2fdb7573623c75248691" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-for-of@^6.23.0" = s."babel-plugin-transform-es2015-for-of@6.23.0";
        "babel-plugin-transform-es2015-function-name@6.24.1" = f "babel-plugin-transform-es2015-function-name" "6.24.1" y "834c89853bc36b1af0f3a4c5dbaa94fd8eacaa8b" [
          (s."babel-helper-function-name@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-function-name@^6.22.0" = s."babel-plugin-transform-es2015-function-name@6.24.1";
        "babel-plugin-transform-es2015-literals@6.22.0" = f "babel-plugin-transform-es2015-literals" "6.22.0" y "4f54a02d6cd66cf915280019a31d31925377ca2e" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-literals@^6.22.0" = s."babel-plugin-transform-es2015-literals@6.22.0";
        "babel-plugin-transform-es2015-modules-amd@6.24.1" = f "babel-plugin-transform-es2015-modules-amd" "6.24.1" y "3b3e54017239842d6d19c3011c4bd2f00a00d154" [
          (s."babel-plugin-transform-es2015-modules-commonjs@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-plugin-transform-es2015-modules-amd@^6.22.0" = s."babel-plugin-transform-es2015-modules-amd@6.24.1";
        "babel-plugin-transform-es2015-modules-amd@^6.24.1" = s."babel-plugin-transform-es2015-modules-amd@6.24.1";
        "babel-plugin-transform-es2015-modules-commonjs@6.26.2" = f "babel-plugin-transform-es2015-modules-commonjs" "6.26.2" y "58a793863a9e7ca870bdc5a881117ffac27db6f3" [
          (s."babel-plugin-transform-strict-mode@^6.24.1")
          (s."babel-runtime@^6.26.0")
          (s."babel-template@^6.26.0")
          (s."babel-types@^6.26.0")
          ];
        "babel-plugin-transform-es2015-modules-commonjs@^6.23.0" = s."babel-plugin-transform-es2015-modules-commonjs@6.26.2";
        "babel-plugin-transform-es2015-modules-commonjs@^6.24.1" = s."babel-plugin-transform-es2015-modules-commonjs@6.26.2";
        "babel-plugin-transform-es2015-modules-systemjs@6.24.1" = f "babel-plugin-transform-es2015-modules-systemjs" "6.24.1" y "ff89a142b9119a906195f5f106ecf305d9407d23" [
          (s."babel-helper-hoist-variables@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-plugin-transform-es2015-modules-systemjs@^6.23.0" = s."babel-plugin-transform-es2015-modules-systemjs@6.24.1";
        "babel-plugin-transform-es2015-modules-umd@6.24.1" = f "babel-plugin-transform-es2015-modules-umd" "6.24.1" y "ac997e6285cd18ed6176adb607d602344ad38468" [
          (s."babel-plugin-transform-es2015-modules-amd@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          ];
        "babel-plugin-transform-es2015-modules-umd@^6.23.0" = s."babel-plugin-transform-es2015-modules-umd@6.24.1";
        "babel-plugin-transform-es2015-object-super@6.24.1" = f "babel-plugin-transform-es2015-object-super" "6.24.1" y "24cef69ae21cb83a7f8603dad021f572eb278f8d" [
          (s."babel-helper-replace-supers@^6.24.1")
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-object-super@^6.22.0" = s."babel-plugin-transform-es2015-object-super@6.24.1";
        "babel-plugin-transform-es2015-parameters@6.24.1" = f "babel-plugin-transform-es2015-parameters" "6.24.1" y "57ac351ab49caf14a97cd13b09f66fdf0a625f2b" [
          (s."babel-helper-call-delegate@^6.24.1")
          (s."babel-helper-get-function-arity@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-template@^6.24.1")
          (s."babel-traverse@^6.24.1")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-parameters@^6.23.0" = s."babel-plugin-transform-es2015-parameters@6.24.1";
        "babel-plugin-transform-es2015-shorthand-properties@6.24.1" = f "babel-plugin-transform-es2015-shorthand-properties" "6.24.1" y "24f875d6721c87661bbd99a4622e51f14de38aa0" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-shorthand-properties@^6.22.0" = s."babel-plugin-transform-es2015-shorthand-properties@6.24.1";
        "babel-plugin-transform-es2015-spread@6.22.0" = f "babel-plugin-transform-es2015-spread" "6.22.0" y "d6d68a99f89aedc4536c81a542e8dd9f1746f8d1" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-spread@^6.22.0" = s."babel-plugin-transform-es2015-spread@6.22.0";
        "babel-plugin-transform-es2015-sticky-regex@6.24.1" = f "babel-plugin-transform-es2015-sticky-regex" "6.24.1" y "00c1cdb1aca71112cdf0cf6126c2ed6b457ccdbc" [
          (s."babel-helper-regex@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-es2015-sticky-regex@^6.22.0" = s."babel-plugin-transform-es2015-sticky-regex@6.24.1";
        "babel-plugin-transform-es2015-template-literals@6.22.0" = f "babel-plugin-transform-es2015-template-literals" "6.22.0" y "a84b3450f7e9f8f1f6839d6d687da84bb1236d8d" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-template-literals@^6.22.0" = s."babel-plugin-transform-es2015-template-literals@6.22.0";
        "babel-plugin-transform-es2015-typeof-symbol@6.23.0" = f "babel-plugin-transform-es2015-typeof-symbol" "6.23.0" y "dec09f1cddff94b52ac73d505c84df59dcceb372" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-es2015-typeof-symbol@^6.23.0" = s."babel-plugin-transform-es2015-typeof-symbol@6.23.0";
        "babel-plugin-transform-es2015-unicode-regex@6.24.1" = f "babel-plugin-transform-es2015-unicode-regex" "6.24.1" y "d38b12f42ea7323f729387f18a7c5ae1faeb35e9" [
          (s."babel-helper-regex@^6.24.1")
          (s."babel-runtime@^6.22.0")
          (s."regexpu-core@^2.0.0")
          ];
        "babel-plugin-transform-es2015-unicode-regex@^6.22.0" = s."babel-plugin-transform-es2015-unicode-regex@6.24.1";
        "babel-plugin-transform-exponentiation-operator@6.24.1" = f "babel-plugin-transform-exponentiation-operator" "6.24.1" y "2ab0c9c7f3098fa48907772bb813fe41e8de3a0e" [
          (s."babel-helper-builder-binary-assignment-operator-visitor@^6.24.1")
          (s."babel-plugin-syntax-exponentiation-operator@^6.8.0")
          (s."babel-runtime@^6.22.0")
          ];
        "babel-plugin-transform-exponentiation-operator@^6.22.0" = s."babel-plugin-transform-exponentiation-operator@6.24.1";
        "babel-plugin-transform-regenerator@6.26.0" = f "babel-plugin-transform-regenerator" "6.26.0" y "e0703696fbde27f0a3efcacf8b4dca2f7b3a8f2f" [
          (s."regenerator-transform@^0.10.0")
          ];
        "babel-plugin-transform-regenerator@^6.22.0" = s."babel-plugin-transform-regenerator@6.26.0";
        "babel-plugin-transform-strict-mode@6.24.1" = f "babel-plugin-transform-strict-mode" "6.24.1" y "d5faf7aa578a65bbe591cf5edae04a0c67020758" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-strict-mode@^6.24.1" = s."babel-plugin-transform-strict-mode@6.24.1";
        "babel-preset-env@1.7.0" = f "babel-preset-env" "1.7.0" y "dea79fa4ebeb883cd35dab07e260c1c9c04df77a" [
          (s."babel-plugin-check-es2015-constants@^6.22.0")
          (s."babel-plugin-syntax-trailing-function-commas@^6.22.0")
          (s."babel-plugin-transform-async-to-generator@^6.22.0")
          (s."babel-plugin-transform-es2015-arrow-functions@^6.22.0")
          (s."babel-plugin-transform-es2015-block-scoped-functions@^6.22.0")
          (s."babel-plugin-transform-es2015-block-scoping@^6.23.0")
          (s."babel-plugin-transform-es2015-classes@^6.23.0")
          (s."babel-plugin-transform-es2015-computed-properties@^6.22.0")
          (s."babel-plugin-transform-es2015-destructuring@^6.23.0")
          (s."babel-plugin-transform-es2015-duplicate-keys@^6.22.0")
          (s."babel-plugin-transform-es2015-for-of@^6.23.0")
          (s."babel-plugin-transform-es2015-function-name@^6.22.0")
          (s."babel-plugin-transform-es2015-literals@^6.22.0")
          (s."babel-plugin-transform-es2015-modules-amd@^6.22.0")
          (s."babel-plugin-transform-es2015-modules-commonjs@^6.23.0")
          (s."babel-plugin-transform-es2015-modules-systemjs@^6.23.0")
          (s."babel-plugin-transform-es2015-modules-umd@^6.23.0")
          (s."babel-plugin-transform-es2015-object-super@^6.22.0")
          (s."babel-plugin-transform-es2015-parameters@^6.23.0")
          (s."babel-plugin-transform-es2015-shorthand-properties@^6.22.0")
          (s."babel-plugin-transform-es2015-spread@^6.22.0")
          (s."babel-plugin-transform-es2015-sticky-regex@^6.22.0")
          (s."babel-plugin-transform-es2015-template-literals@^6.22.0")
          (s."babel-plugin-transform-es2015-typeof-symbol@^6.23.0")
          (s."babel-plugin-transform-es2015-unicode-regex@^6.22.0")
          (s."babel-plugin-transform-exponentiation-operator@^6.22.0")
          (s."babel-plugin-transform-regenerator@^6.22.0")
          (s."browserslist@^3.2.6")
          (s."invariant@^2.2.2")
          (s."semver@^5.3.0")
          ];
        "babel-preset-env@^1.7.0" = s."babel-preset-env@1.7.0";
        "babel-register@6.26.0" = f "babel-register" "6.26.0" y "6ed021173e2fcb486d7acb45c6009a856f647071" [
          (s."babel-core@^6.26.0")
          (s."babel-runtime@^6.26.0")
          (s."core-js@^2.5.0")
          (s."home-or-tmp@^2.0.0")
          (s."lodash@^4.17.4")
          (s."mkdirp@^0.5.1")
          (s."source-map-support@^0.4.15")
          ];
        "babel-register@^6.26.0" = s."babel-register@6.26.0";
        "babel-runtime@6.26.0" = f "babel-runtime" "6.26.0" y "965c7058668e82b55d7bfe04ff2337bc8b5647fe" [
          (s."core-js@^2.4.0")
          (s."regenerator-runtime@^0.11.0")
          ];
        "babel-runtime@^6.18.0" = s."babel-runtime@6.26.0";
        "babel-runtime@^6.22.0" = s."babel-runtime@6.26.0";
        "babel-runtime@^6.26.0" = s."babel-runtime@6.26.0";
        "babel-template@6.26.0" = f "babel-template" "6.26.0" y "de03e2d16396b069f46dd9fff8521fb1a0e35e02" [
          (s."babel-runtime@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."lodash@^4.17.4")
          ];
        "babel-template@^6.24.1" = s."babel-template@6.26.0";
        "babel-template@^6.26.0" = s."babel-template@6.26.0";
        "babel-traverse@6.26.0" = f "babel-traverse" "6.26.0" y "46a9cbd7edcc62c8e5c064e2d2d8d0f4035766ee" [
          (s."babel-code-frame@^6.26.0")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."debug@^2.6.8")
          (s."globals@^9.18.0")
          (s."invariant@^2.2.2")
          (s."lodash@^4.17.4")
          ];
        "babel-traverse@^6.24.1" = s."babel-traverse@6.26.0";
        "babel-traverse@^6.26.0" = s."babel-traverse@6.26.0";
        "babel-types@6.26.0" = f "babel-types" "6.26.0" y "a3b073f94ab49eb6fa55cd65227a334380632497" [
          (s."babel-runtime@^6.26.0")
          (s."esutils@^2.0.2")
          (s."lodash@^4.17.4")
          (s."to-fast-properties@^1.0.3")
          ];
        "babel-types@^6.19.0" = s."babel-types@6.26.0";
        "babel-types@^6.24.1" = s."babel-types@6.26.0";
        "babel-types@^6.26.0" = s."babel-types@6.26.0";
        "babelify@7.3.0" = f "babelify" "7.3.0" y "aa56aede7067fd7bd549666ee16dc285087e88e5" [
          (s."babel-core@^6.0.14")
          (s."object-assign@^4.0.0")
          ];
        "babelify@^7.3.0" = s."babelify@7.3.0";
        "babylon@6.18.0" = f "babylon" "6.18.0" y "af2f3b88fa6f5c1e4c634d1a0f8eac4f55b395e3" [];
        "babylon@^6.18.0" = s."babylon@6.18.0";
        "backoff@2.5.0" = f "backoff" "2.5.0" y "f616eda9d3e4b66b8ca7fca79f695722c5f8e26f" [
          (s."precond@0.2")
          ];
        "backoff@^2.5.0" = s."backoff@2.5.0";
        "balanced-match@1.0.0" = f "balanced-match" "1.0.0" y "89b4d199ab2bee49de164ea02b89ce462d71b767" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.0";
        "base-x@3.0.8" = f "base-x" "3.0.8" y "1e1106c2537f0162e8b52474a557ebb09000018d" [
          (s."safe-buffer@^5.0.1")
          ];
        "base-x@^3.0.2" = s."base-x@3.0.8";
        "base-x@^3.0.8" = s."base-x@3.0.8";
        "base64-js@1.3.1" = f "base64-js" "1.3.1" y "58ece8cb75dd07e71ed08c736abc5fac4dbf8df1" [];
        "base64-js@^1.0.2" = s."base64-js@1.3.1";
        "base@0.11.2" = f "base" "0.11.2" y "7bde5ced145b6d551a90db87f83c558b4eb48a8f" [
          (s."cache-base@^1.0.1")
          (s."class-utils@^0.3.5")
          (s."component-emitter@^1.2.1")
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.1")
          (s."mixin-deep@^1.2.0")
          (s."pascalcase@^0.1.1")
          ];
        "base@^0.11.1" = s."base@0.11.2";
        "bcrypt-pbkdf@1.0.2" = f "bcrypt-pbkdf" "1.0.2" y "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e" [
          (s."tweetnacl@^0.14.3")
          ];
        "bcrypt-pbkdf@^1.0.0" = s."bcrypt-pbkdf@1.0.2";
        "before-after-hook@2.1.0" = f "before-after-hook" "2.1.0" y "b6c03487f44e24200dd30ca5e6a1979c5d2fb635" [];
        "before-after-hook@^2.1.0" = s."before-after-hook@2.1.0";
        "big.js@5.2.2" = f "big.js" "5.2.2" y "65f0af382f578bcdc742bd9c281e9cb2d7768328" [];
        "big.js@^5.2.2" = s."big.js@5.2.2";
        "bignumber.js@9.0.1" = f "bignumber.js" "9.0.1" y "8d7ba124c882bfd8e43260c67475518d0689e4e5" [];
        "bignumber.js@^9.0.0" = s."bignumber.js@9.0.1";
        "bin-links@1.1.8" = f "bin-links" "1.1.8" y "bd39aadab5dc4bdac222a07df5baf1af745b2228" [
          (s."bluebird@^3.5.3")
          (s."cmd-shim@^3.0.0")
          (s."gentle-fs@^2.3.0")
          (s."graceful-fs@^4.1.15")
          (s."npm-normalize-package-bin@^1.0.0")
          (s."write-file-atomic@^2.3.0")
          ];
        "bin-links@^1.1.2" = s."bin-links@1.1.8";
        "bin-links@^1.1.8" = s."bin-links@1.1.8";
        "binary-extensions@1.13.1" = f "binary-extensions" "1.13.1" y "598afe54755b2868a5330d2aff9d4ebb53209b65" [];
        "binary-extensions@2.1.0" = f "binary-extensions" "2.1.0" y "30fa40c9e7fe07dbc895678cd287024dea241dd9" [];
        "binary-extensions@^1.0.0" = s."binary-extensions@1.13.1";
        "binary-extensions@^2.0.0" = s."binary-extensions@2.1.0";
        "bindings@1.5.0" = f "bindings" "1.5.0" y "10353c9e945334bc0511a6d90b38fbc7c9c504df" [
          (s."file-uri-to-path@1.0.0")
          ];
        "bindings@^1.5.0" = s."bindings@1.5.0";
        "bip39@2.5.0" = f "bip39" "2.5.0" y "51cbd5179460504a63ea3c000db3f787ca051235" [
          (s."create-hash@^1.1.0")
          (s."pbkdf2@^3.0.9")
          (s."randombytes@^2.0.1")
          (s."safe-buffer@^5.0.1")
          (s."unorm@^1.3.3")
          ];
        "blakejs@1.1.0" = f "blakejs" "1.1.0" y "69df92ef953aa88ca51a32df6ab1c54a155fc7a5" [];
        "blakejs@^1.1.0" = s."blakejs@1.1.0";
        "bluebird@3.5.5" = f "bluebird" "3.5.5" y "a8d0afd73251effbbd5fe384a77d73003c17a71f" [];
        "bluebird@3.7.2" = f "bluebird" "3.7.2" y "9f229c15be272454ffa973ace0dbee79a1b0c36f" [];
        "bluebird@^3.5.0" = s."bluebird@3.7.2";
        "bluebird@^3.5.1" = s."bluebird@3.5.5";
        "bluebird@^3.5.3" = s."bluebird@3.5.5";
        "bluebird@^3.5.5" = s."bluebird@3.5.5";
        "bn.js@4.11.6" = f "bn.js" "4.11.6" y "53344adb14617a13f6e8dd2ce28905d1c0ba3215" [];
        "bn.js@4.11.9" = f "bn.js" "4.11.9" y "26d556829458f9d1e81fc48952493d0ba3507828" [];
        "bn.js@5.1.3" = f "bn.js" "5.1.3" y "beca005408f642ebebea80b042b4d18d2ac0ee6b" [];
        "bn.js@^4.0.0" = s."bn.js@4.11.9";
        "bn.js@^4.1.0" = s."bn.js@4.11.9";
        "bn.js@^4.10.0" = s."bn.js@4.11.9";
        "bn.js@^4.11.0" = s."bn.js@4.11.9";
        "bn.js@^4.11.1" = s."bn.js@4.11.9";
        "bn.js@^4.11.6" = s."bn.js@4.11.9";
        "bn.js@^4.11.8" = s."bn.js@4.11.9";
        "bn.js@^4.11.9" = s."bn.js@4.11.9";
        "bn.js@^4.4.0" = s."bn.js@4.11.9";
        "bn.js@^4.8.0" = s."bn.js@4.11.9";
        "bn.js@^5.1.1" = s."bn.js@5.1.3";
        "bn.js@^5.1.2" = s."bn.js@5.1.3";
        "body-parser@1.19.0" = f "body-parser" "1.19.0" y "96b2709e57c9c4e09a6fd66a8fd979844f69f08a" [
          (s."bytes@3.1.0")
          (s."content-type@~1.0.4")
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."http-errors@1.7.2")
          (s."iconv-lite@0.4.24")
          (s."on-finished@~2.3.0")
          (s."qs@6.7.0")
          (s."raw-body@2.4.0")
          (s."type-is@~1.6.17")
          ];
        "body-parser@^1.16.0" = s."body-parser@1.19.0";
        "bottleneck@2.19.5" = f "bottleneck" "2.19.5" y "5df0b90f59fd47656ebe63c78a98419205cadd91" [];
        "bottleneck@^2.18.1" = s."bottleneck@2.19.5";
        "boxen@1.3.0" = f "boxen" "1.3.0" y "55c6c39a8ba58d9c61ad22cd877532deb665a20b" [
          (s."ansi-align@^2.0.0")
          (s."camelcase@^4.0.0")
          (s."chalk@^2.0.1")
          (s."cli-boxes@^1.0.0")
          (s."string-width@^2.0.0")
          (s."term-size@^1.2.0")
          (s."widest-line@^2.0.0")
          ];
        "boxen@^1.2.1" = s."boxen@1.3.0";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "braces@2.3.2" = f "braces" "2.3.2" y "5979fd3f14cd531565e5fa2df1abfff1dfaee729" [
          (s."arr-flatten@^1.1.0")
          (s."array-unique@^0.3.2")
          (s."extend-shallow@^2.0.1")
          (s."fill-range@^4.0.0")
          (s."isobject@^3.0.1")
          (s."repeat-element@^1.1.2")
          (s."snapdragon@^0.8.1")
          (s."snapdragon-node@^2.0.1")
          (s."split-string@^3.0.2")
          (s."to-regex@^3.0.1")
          ];
        "braces@3.0.2" = f "braces" "3.0.2" y "3454e1a462ee8d599e236df336cd9ea4f8afe107" [
          (s."fill-range@^7.0.1")
          ];
        "braces@^2.3.1" = s."braces@2.3.2";
        "braces@^2.3.2" = s."braces@2.3.2";
        "braces@^3.0.1" = s."braces@3.0.2";
        "braces@~3.0.2" = s."braces@3.0.2";
        "brorand@1.1.0" = f "brorand" "1.1.0" y "12c25efe40a45e3c323eb8675a0a0ce57b22371f" [];
        "brorand@^1.0.1" = s."brorand@1.1.0";
        "browserify-aes@1.2.0" = f "browserify-aes" "1.2.0" y "326734642f403dabc3003209853bb70ad428ef48" [
          (s."buffer-xor@^1.0.3")
          (s."cipher-base@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.3")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "browserify-aes@^1.0.0" = s."browserify-aes@1.2.0";
        "browserify-aes@^1.0.4" = s."browserify-aes@1.2.0";
        "browserify-aes@^1.2.0" = s."browserify-aes@1.2.0";
        "browserify-cipher@1.0.1" = f "browserify-cipher" "1.0.1" y "8d6474c1b870bfdabcd3bcfcc1934a10e94f15f0" [
          (s."browserify-aes@^1.0.4")
          (s."browserify-des@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
          ];
        "browserify-cipher@^1.0.0" = s."browserify-cipher@1.0.1";
        "browserify-des@1.0.2" = f "browserify-des" "1.0.2" y "3af4f1f59839403572f1c66204375f7a7f703e9c" [
          (s."cipher-base@^1.0.1")
          (s."des.js@^1.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "browserify-des@^1.0.0" = s."browserify-des@1.0.2";
        "browserify-rsa@4.0.1" = f "browserify-rsa" "4.0.1" y "21e0abfaf6f2029cf2fafb133567a701d4135524" [
          (s."bn.js@^4.1.0")
          (s."randombytes@^2.0.1")
          ];
        "browserify-rsa@^4.0.0" = s."browserify-rsa@4.0.1";
        "browserify-rsa@^4.0.1" = s."browserify-rsa@4.0.1";
        "browserify-sign@4.2.1" = f "browserify-sign" "4.2.1" y "eaf4add46dd54be3bb3b36c0cf15abbeba7956c3" [
          (s."bn.js@^5.1.1")
          (s."browserify-rsa@^4.0.1")
          (s."create-hash@^1.2.0")
          (s."create-hmac@^1.1.7")
          (s."elliptic@^6.5.3")
          (s."inherits@^2.0.4")
          (s."parse-asn1@^5.1.5")
          (s."readable-stream@^3.6.0")
          (s."safe-buffer@^5.2.0")
          ];
        "browserify-sign@^4.0.0" = s."browserify-sign@4.2.1";
        "browserify-zlib@0.2.0" = f "browserify-zlib" "0.2.0" y "2869459d9aa3be245fe8fe2ca1f46e2e7f54d73f" [
          (s."pako@~1.0.5")
          ];
        "browserify-zlib@^0.2.0" = s."browserify-zlib@0.2.0";
        "browserslist@3.2.8" = f "browserslist" "3.2.8" y "b0005361d6471f0f5952797a76fc985f1f978fc6" [
          (s."caniuse-lite@^1.0.30000844")
          (s."electron-to-chromium@^1.3.47")
          ];
        "browserslist@^3.2.6" = s."browserslist@3.2.8";
        "bs58@4.0.1" = f "bs58" "4.0.1" y "be161e76c354f6f788ae4071f63f34e8c4f0a42a" [
          (s."base-x@^3.0.2")
          ];
        "bs58@^4.0.0" = s."bs58@4.0.1";
        "bs58check@2.1.2" = f "bs58check" "2.1.2" y "53b018291228d82a5aa08e7d796fdafda54aebfc" [
          (s."bs58@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."safe-buffer@^5.1.2")
          ];
        "bs58check@^2.1.2" = s."bs58check@2.1.2";
        "buffer-from@1.0.0" = f "buffer-from" "1.0.0" y "4cb8832d23612589b0406e9e2956c17f06fdf531" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.0.0";
        "buffer-to-arraybuffer@0.0.5" = f "buffer-to-arraybuffer" "0.0.5" y "6064a40fa76eb43c723aba9ef8f6e1216d10511a" [];
        "buffer-to-arraybuffer@^0.0.5" = s."buffer-to-arraybuffer@0.0.5";
        "buffer-xor@1.0.3" = f "buffer-xor" "1.0.3" y "26e61ed1422fb70dd42e6e36729ed51d855fe8d9" [];
        "buffer-xor@2.0.2" = f "buffer-xor" "2.0.2" y "34f7c64f04c777a1f8aac5e661273bb9dd320289" [
          (s."safe-buffer@^5.1.1")
          ];
        "buffer-xor@^1.0.3" = s."buffer-xor@1.0.3";
        "buffer-xor@^2.0.1" = s."buffer-xor@2.0.2";
        "buffer@4.9.2" = f "buffer" "4.9.2" y "230ead344002988644841ab0244af8c44bbe3ef8" [
          (s."base64-js@^1.0.2")
          (s."ieee754@^1.1.4")
          (s."isarray@^1.0.0")
          ];
        "buffer@5.6.0" = f "buffer" "5.6.0" y "a31749dc7d81d84db08abf937b6b8c4033f62786" [
          (s."base64-js@^1.0.2")
          (s."ieee754@^1.1.4")
          ];
        "buffer@^4.3.0" = s."buffer@4.9.2";
        "buffer@^5.0.5" = s."buffer@5.6.0";
        "buffer@^5.2.1" = s."buffer@5.6.0";
        "buffer@^5.5.0" = s."buffer@5.6.0";
        "buffer@^5.6.0" = s."buffer@5.6.0";
        "bufferutil@4.0.1" = f "bufferutil" "4.0.1" y "3a177e8e5819a1243fe16b63a199951a7ad8d4a7" [
          (s."node-gyp-build@~3.7.0")
          ];
        "bufferutil@^4.0.1" = s."bufferutil@4.0.1";
        "builtin-status-codes@3.0.0" = f "builtin-status-codes" "3.0.0" y "85982878e21b98e1c66425e03d0174788f569ee8" [];
        "builtin-status-codes@^3.0.0" = s."builtin-status-codes@3.0.0";
        "builtins@1.0.3" = f "builtins" "1.0.3" y "cb94faeb61c8696451db36534e1422f94f0aee88" [];
        "builtins@^1.0.3" = s."builtins@1.0.3";
        "byline@5.0.0" = f "byline" "5.0.0" y "741c5216468eadc457b03410118ad77de8c1ddb1" [];
        "byline@^5.0.0" = s."byline@5.0.0";
        "byte-size@5.0.1" = f "byte-size" "5.0.1" y "4b651039a5ecd96767e71a3d7ed380e48bed4191" [];
        "byte-size@^5.0.1" = s."byte-size@5.0.1";
        "bytes@3.1.0" = f "bytes" "3.1.0" y "f6cf7933a360e0588fa9fde85651cdc7f805d1f6" [];
        "bytewise-core@1.2.3" = f "bytewise-core" "1.2.3" y "3fb410c7e91558eb1ab22a82834577aa6bd61d42" [
          (s."typewise-core@^1.2")
          ];
        "bytewise-core@^1.2.2" = s."bytewise-core@1.2.3";
        "bytewise@1.1.0" = f "bytewise" "1.1.0" y "1d13cbff717ae7158094aa881b35d081b387253e" [
          (s."bytewise-core@^1.2.2")
          (s."typewise@^1.0.3")
          ];
        "bytewise@~1.1.0" = s."bytewise@1.1.0";
        "cacache@12.0.3" = f "cacache" "12.0.3" y "be99abba4e1bf5df461cd5a2c1071fc432573390" [
          (s."bluebird@^3.5.5")
          (s."chownr@^1.1.1")
          (s."figgy-pudding@^3.5.1")
          (s."glob@^7.1.4")
          (s."graceful-fs@^4.1.15")
          (s."infer-owner@^1.0.3")
          (s."lru-cache@^5.1.1")
          (s."mississippi@^3.0.0")
          (s."mkdirp@^0.5.1")
          (s."move-concurrently@^1.0.1")
          (s."promise-inflight@^1.0.1")
          (s."rimraf@^2.6.3")
          (s."ssri@^6.0.1")
          (s."unique-filename@^1.1.1")
          (s."y18n@^4.0.0")
          ];
        "cacache@^12.0.0" = s."cacache@12.0.3";
        "cacache@^12.0.2" = s."cacache@12.0.3";
        "cacache@^12.0.3" = s."cacache@12.0.3";
        "cache-base@1.0.1" = f "cache-base" "1.0.1" y "0a7f46416831c8b662ee36fe4e7c59d76f666ab2" [
          (s."collection-visit@^1.0.0")
          (s."component-emitter@^1.2.1")
          (s."get-value@^2.0.6")
          (s."has-value@^1.0.0")
          (s."isobject@^3.0.1")
          (s."set-value@^2.0.0")
          (s."to-object-path@^0.3.0")
          (s."union-value@^1.0.0")
          (s."unset-value@^1.0.0")
          ];
        "cache-base@^1.0.1" = s."cache-base@1.0.1";
        "cacheable-request@6.1.0" = f "cacheable-request" "6.1.0" y "20ffb8bd162ba4be11e9567d823db651052ca912" [
          (s."clone-response@^1.0.2")
          (s."get-stream@^5.1.0")
          (s."http-cache-semantics@^4.0.0")
          (s."keyv@^3.0.0")
          (s."lowercase-keys@^2.0.0")
          (s."normalize-url@^4.1.0")
          (s."responselike@^1.0.2")
          ];
        "cacheable-request@^6.0.0" = s."cacheable-request@6.1.0";
        "cachedown@1.0.0" = f "cachedown" "1.0.0" y "d43f036e4510696b31246d7db31ebf0f7ac32d15" [
          (s."abstract-leveldown@^2.4.1")
          (s."lru-cache@^3.2.0")
          ];
        "call-limit@1.1.1" = f "call-limit" "1.1.1" y "ef15f2670db3f1992557e2d965abc459e6e358d4" [];
        "call-limit@^1.1.1" = s."call-limit@1.1.1";
        "callsites@3.1.0" = f "callsites" "3.1.0" y "b3630abd8943432f54b3f0519238e33cd7df2f73" [];
        "callsites@^3.0.0" = s."callsites@3.1.0";
        "camelcase-keys@6.2.2" = f "camelcase-keys" "6.2.2" y "5e755d6ba51aa223ec7d3d52f25778210f9dc3c0" [
          (s."camelcase@^5.3.1")
          (s."map-obj@^4.0.0")
          (s."quick-lru@^4.0.1")
          ];
        "camelcase-keys@^6.2.2" = s."camelcase-keys@6.2.2";
        "camelcase@4.1.0" = f "camelcase" "4.1.0" y "d545635be1e33c542649c69173e5de6acfae34dd" [];
        "camelcase@5.3.1" = f "camelcase" "5.3.1" y "e3c9b31569e106811df242f715725a1f4c494320" [];
        "camelcase@^4.0.0" = s."camelcase@4.1.0";
        "camelcase@^5.0.0" = s."camelcase@5.3.1";
        "camelcase@^5.3.1" = s."camelcase@5.3.1";
        "caniuse-lite@1.0.30001146" = f "caniuse-lite" "1.0.30001146" y "c61fcb1474520c1462913689201fb292ba6f447c" [];
        "caniuse-lite@^1.0.30000844" = s."caniuse-lite@1.0.30001146";
        "capture-stack-trace@1.0.0" = f "capture-stack-trace" "1.0.0" y "4a6fa07399c26bba47f0b2496b4d0fb408c5550d" [];
        "capture-stack-trace@^1.0.0" = s."capture-stack-trace@1.0.0";
        "cardinal@2.1.1" = f "cardinal" "2.1.1" y "7cc1055d822d212954d07b085dea251cc7bc5505" [
          (s."ansicolors@~0.3.2")
          (s."redeyed@~2.1.0")
          ];
        "cardinal@^2.1.1" = s."cardinal@2.1.1";
        "caseless@0.12.0" = f "caseless" "0.12.0" y "1b681c21ff84033c826543090689420d187151dc" [];
        "caseless@~0.12.0" = s."caseless@0.12.0";
        "chalk@1.1.3" = f "chalk" "1.1.3" y "a8115c55e4a702fe4d150abd3872822a7e09fc98" [
          (s."ansi-styles@^2.2.1")
          (s."escape-string-regexp@^1.0.2")
          (s."has-ansi@^2.0.0")
          (s."strip-ansi@^3.0.0")
          (s."supports-color@^2.0.0")
          ];
        "chalk@2.4.1" = f "chalk" "2.4.1" y "18c49ab16a037b6eb0152cc83e3471338215b66e" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@4.1.0" = f "chalk" "4.1.0" y "4e14870a618d9e2edd97dd8345fd9d9dc315646a" [
          (s."ansi-styles@^4.1.0")
          (s."supports-color@^7.1.0")
          ];
        "chalk@^1.1.3" = s."chalk@1.1.3";
        "chalk@^2.0.0" = s."chalk@2.4.2";
        "chalk@^2.0.1" = s."chalk@2.4.1";
        "chalk@^2.3.2" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "chalk@^4.0.0" = s."chalk@4.1.0";
        "checkpoint-store@1.1.0" = f "checkpoint-store" "1.1.0" y "04e4cb516b91433893581e6d4601a78e9552ea06" [
          (s."functional-red-black-tree@^1.0.1")
          ];
        "checkpoint-store@^1.1.0" = s."checkpoint-store@1.1.0";
        "chokidar@2.1.8" = f "chokidar" "2.1.8" y "804b3a7b6a99358c3c5c61e71d8728f041cff917" [
          (s."anymatch@^2.0.0")
          (s."async-each@^1.0.1")
          (s."braces@^2.3.2")
          (s."glob-parent@^3.1.0")
          (s."inherits@^2.0.3")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^4.0.0")
          (s."normalize-path@^3.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.2.1")
          (s."upath@^1.1.1")
          (s."fsevents@^1.2.7")
          ];
        "chokidar@3.4.2" = f "chokidar" "3.4.2" y "38dc8e658dec3809741eb3ef7bb0a47fe424232d" [
          (s."anymatch@~3.1.1")
          (s."braces@~3.0.2")
          (s."glob-parent@~5.1.0")
          (s."is-binary-path@~2.1.0")
          (s."is-glob@~4.0.1")
          (s."normalize-path@~3.0.0")
          (s."readdirp@~3.4.0")
          (s."fsevents@~2.1.2")
          ];
        "chokidar@^2.1.8" = s."chokidar@2.1.8";
        "chokidar@^3.4.1" = s."chokidar@3.4.2";
        "chownr@1.1.4" = f "chownr" "1.1.4" y "6fc9d7b42d32a583596337666e7d08084da2cc6b" [];
        "chownr@^1.1.1" = s."chownr@1.1.4";
        "chownr@^1.1.2" = s."chownr@1.1.4";
        "chownr@^1.1.4" = s."chownr@1.1.4";
        "chrome-trace-event@1.0.2" = f "chrome-trace-event" "1.0.2" y "234090ee97c7d4ad1a2c4beae27505deffc608a4" [
          (s."tslib@^1.9.0")
          ];
        "chrome-trace-event@^1.0.2" = s."chrome-trace-event@1.0.2";
        "ci-info@1.6.0" = f "ci-info" "1.6.0" y "2ca20dbb9ceb32d4524a683303313f0304b1e497" [];
        "ci-info@2.0.0" = f "ci-info" "2.0.0" y "67a9e964be31a51e15e5010d58e6f12834002f46" [];
        "ci-info@^1.5.0" = s."ci-info@1.6.0";
        "ci-info@^2.0.0" = s."ci-info@2.0.0";
        "cidr-regex@2.0.10" = f "cidr-regex" "2.0.10" y "af13878bd4ad704de77d6dc800799358b3afa70d" [
          (s."ip-regex@^2.1.0")
          ];
        "cidr-regex@^2.0.10" = s."cidr-regex@2.0.10";
        "cids@0.7.5" = f "cids" "0.7.5" y "60a08138a99bfb69b6be4ceb63bfef7a396b28b2" [
          (s."buffer@^5.5.0")
          (s."class-is@^1.1.0")
          (s."multibase@~0.6.0")
          (s."multicodec@^1.0.0")
          (s."multihashes@~0.4.15")
          ];
        "cids@^0.7.1" = s."cids@0.7.5";
        "cipher-base@1.0.4" = f "cipher-base" "1.0.4" y "8760e4ecc272f4c363532f926d874aae2c1397de" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "cipher-base@^1.0.0" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.1" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.3" = s."cipher-base@1.0.4";
        "class-is@1.1.0" = f "class-is" "1.1.0" y "9d3c0fba0440d211d843cec3dedfa48055005825" [];
        "class-is@^1.1.0" = s."class-is@1.1.0";
        "class-utils@0.3.6" = f "class-utils" "0.3.6" y "f93369ae8b9a7ce02fd41faad0ca83033190c463" [
          (s."arr-union@^3.1.0")
          (s."define-property@^0.2.5")
          (s."isobject@^3.0.0")
          (s."static-extend@^0.1.1")
          ];
        "class-utils@^0.3.5" = s."class-utils@0.3.6";
        "clean-stack@2.2.0" = f "clean-stack" "2.2.0" y "ee8472dbb129e727b31e8a10a427dee9dfe4008b" [];
        "clean-stack@^2.0.0" = s."clean-stack@2.2.0";
        "cli-boxes@1.0.0" = f "cli-boxes" "1.0.0" y "4fa917c3e59c94a004cd61f8ee509da651687143" [];
        "cli-boxes@^1.0.0" = s."cli-boxes@1.0.0";
        "cli-columns@3.1.2" = f "cli-columns" "3.1.2" y "6732d972979efc2ae444a1f08e08fa139c96a18e" [
          (s."string-width@^2.0.0")
          (s."strip-ansi@^3.0.1")
          ];
        "cli-columns@^3.1.2" = s."cli-columns@3.1.2";
        "cli-table3@0.5.1" = f "cli-table3" "0.5.1" y "0252372d94dfc40dbd8df06005f48f31f656f202" [
          (s."object-assign@^4.1.0")
          (s."string-width@^2.1.1")
          (s."colors@^1.1.2")
          ];
        "cli-table3@^0.5.0" = s."cli-table3@0.5.1";
        "cli-table3@^0.5.1" = s."cli-table3@0.5.1";
        "cli-table@0.3.1" = f "cli-table" "0.3.1" y "f53b05266a8b1a0b934b3d0821e6e2dc5914ae23" [
          (s."colors@1.0.3")
          ];
        "cli-table@^0.3.1" = s."cli-table@0.3.1";
        "cliui@5.0.0" = f "cliui" "5.0.0" y "deefcfdb2e800784aa34f46fa08e06851c7bbbc5" [
          (s."string-width@^3.1.0")
          (s."strip-ansi@^5.2.0")
          (s."wrap-ansi@^5.1.0")
          ];
        "cliui@6.0.0" = f "cliui" "6.0.0" y "511d702c0c4e41ca156d7d0e96021f23e13225b1" [
          (s."string-width@^4.2.0")
          (s."strip-ansi@^6.0.0")
          (s."wrap-ansi@^6.2.0")
          ];
        "cliui@^5.0.0" = s."cliui@5.0.0";
        "cliui@^6.0.0" = s."cliui@6.0.0";
        "clone-response@1.0.2" = f "clone-response" "1.0.2" y "d1dc973920314df67fbeb94223b4ee350239e96b" [
          (s."mimic-response@^1.0.0")
          ];
        "clone-response@^1.0.2" = s."clone-response@1.0.2";
        "clone@1.0.4" = f "clone" "1.0.4" y "da309cc263df15994c688ca902179ca3c7cd7c7e" [];
        "clone@2.1.2" = f "clone" "2.1.2" y "1b7f4b9f591f1e8f83670401600345a02887435f" [];
        "clone@^1.0.2" = s."clone@1.0.4";
        "clone@^2.0.0" = s."clone@2.1.2";
        "cmd-shim@3.0.3" = f "cmd-shim" "3.0.3" y "2c35238d3df37d98ecdd7d5f6b8dc6b21cadc7cb" [
          (s."graceful-fs@^4.1.2")
          (s."mkdirp@~0.5.0")
          ];
        "cmd-shim@^3.0.0" = s."cmd-shim@3.0.3";
        "cmd-shim@^3.0.3" = s."cmd-shim@3.0.3";
        "co@4.6.0" = f "co" "4.6.0" y "6ea6bdf3d853ae54ccb8e47bfa0bf3f9031fb184" [];
        "co@^4.6.0" = s."co@4.6.0";
        "code-point-at@1.1.0" = f "code-point-at" "1.1.0" y "0d070b4d043a5bea33a2f1a40e2edb3d9a4ccf77" [];
        "code-point-at@^1.0.0" = s."code-point-at@1.1.0";
        "collection-visit@1.0.0" = f "collection-visit" "1.0.0" y "4bc0373c164bc3291b4d368c829cf1a80a59dca0" [
          (s."map-visit@^1.0.0")
          (s."object-visit@^1.0.0")
          ];
        "collection-visit@^1.0.0" = s."collection-visit@1.0.0";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@2.0.1" = f "color-convert" "2.0.1" y "72d3a68d598c9bdb3af2ad1e84f21d896abd4de3" [
          (s."color-name@~1.1.4")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-convert@^2.0.1" = s."color-convert@2.0.1";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "color-name@1.1.4" = f "color-name" "1.1.4" y "c2a09a87acbde69543de6f63fa3995c826c536a2" [];
        "color-name@~1.1.4" = s."color-name@1.1.4";
        "colors@1.0.3" = f "colors" "1.0.3" y "0433f44d809680fdeb60ed260f1b0c262e82a40b" [];
        "colors@1.3.3" = f "colors" "1.3.3" y "39e005d546afe01e01f9c4ca8fa50f686a01205d" [];
        "colors@^1.1.2" = s."colors@1.3.3";
        "columnify@1.5.4" = f "columnify" "1.5.4" y "4737ddf1c7b69a8a7c340570782e947eec8e78bb" [
          (s."strip-ansi@^3.0.0")
          (s."wcwidth@^1.0.0")
          ];
        "columnify@~1.5.4" = s."columnify@1.5.4";
        "combined-stream@1.0.6" = f "combined-stream" "1.0.6" y "723e7df6e801ac5613113a7e445a9b69cb632818" [
          (s."delayed-stream@~1.0.0")
          ];
        "combined-stream@1.0.8" = f "combined-stream" "1.0.8" y "c3d45a8b34fd730631a110a8a2520682b31d5a7f" [
          (s."delayed-stream@~1.0.0")
          ];
        "combined-stream@^1.0.6" = s."combined-stream@1.0.8";
        "combined-stream@~1.0.6" = s."combined-stream@1.0.6";
        "commander@2.20.3" = f "commander" "2.20.3" y "fd485e84c03eb4881c20722ba48035e8531aeb33" [];
        "commander@^2.20.0" = s."commander@2.20.3";
        "commondir@1.0.1" = f "commondir" "1.0.1" y "ddd800da0c66127393cca5950ea968a3aaf1253b" [];
        "commondir@^1.0.1" = s."commondir@1.0.1";
        "compare-func@2.0.0" = f "compare-func" "2.0.0" y "fb65e75edbddfd2e568554e8b5b05fff7a51fcb3" [
          (s."array-ify@^1.0.0")
          (s."dot-prop@^5.1.0")
          ];
        "compare-func@^2.0.0" = s."compare-func@2.0.0";
        "component-emitter@1.3.0" = f "component-emitter" "1.3.0" y "16e4070fba8ae29b679f2215853ee181ab2eabc0" [];
        "component-emitter@^1.2.1" = s."component-emitter@1.3.0";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concat-stream@1.6.2" = f "concat-stream" "1.6.2" y "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34" [
          (s."buffer-from@^1.0.0")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.2")
          (s."typedarray@^0.0.6")
          ];
        "concat-stream@^1.5.0" = s."concat-stream@1.6.2";
        "concat-stream@^1.5.1" = s."concat-stream@1.6.2";
        "config-chain@1.1.12" = f "config-chain" "1.1.12" y "0fde8d091200eb5e808caf25fe618c02f48e4efa" [
          (s."ini@^1.3.4")
          (s."proto-list@~1.2.1")
          ];
        "config-chain@^1.1.12" = s."config-chain@1.1.12";
        "configstore@3.1.5" = f "configstore" "3.1.5" y "e9af331fadc14dabd544d3e7e76dc446a09a530f" [
          (s."dot-prop@^4.2.1")
          (s."graceful-fs@^4.1.2")
          (s."make-dir@^1.0.0")
          (s."unique-string@^1.0.0")
          (s."write-file-atomic@^2.0.0")
          (s."xdg-basedir@^3.0.0")
          ];
        "configstore@^3.0.0" = s."configstore@3.1.5";
        "console-browserify@1.2.0" = f "console-browserify" "1.2.0" y "67063cef57ceb6cf4993a2ab3a55840ae8c49336" [];
        "console-browserify@^1.1.0" = s."console-browserify@1.2.0";
        "console-control-strings@1.1.0" = f "console-control-strings" "1.1.0" y "3d7cf4464db6446ea644bf4b39507f9851008e8e" [];
        "console-control-strings@^1.0.0" = s."console-control-strings@1.1.0";
        "console-control-strings@^1.1.0" = s."console-control-strings@1.1.0";
        "console-control-strings@~1.1.0" = s."console-control-strings@1.1.0";
        "constants-browserify@1.0.0" = f "constants-browserify" "1.0.0" y "c20b96d8c617748aaf1c16021760cd27fcb8cb75" [];
        "constants-browserify@^1.0.0" = s."constants-browserify@1.0.0";
        "content-disposition@0.5.3" = f "content-disposition" "0.5.3" y "e130caf7e7279087c5616c2007d0485698984fbd" [
          (s."safe-buffer@5.1.2")
          ];
        "content-hash@2.5.2" = f "content-hash" "2.5.2" y "bbc2655e7c21f14fd3bfc7b7d4bfe6e454c9e211" [
          (s."cids@^0.7.1")
          (s."multicodec@^0.5.5")
          (s."multihashes@^0.4.15")
          ];
        "content-hash@^2.5.2" = s."content-hash@2.5.2";
        "content-type@1.0.4" = f "content-type" "1.0.4" y "e138cc75e040c727b1966fe5e5f8c9aee256fe3b" [];
        "content-type@~1.0.4" = s."content-type@1.0.4";
        "conventional-changelog-angular@5.0.11" = f "conventional-changelog-angular" "5.0.11" y "99a3ca16e4a5305e0c2c2fae3ef74fd7631fc3fb" [
          (s."compare-func@^2.0.0")
          (s."q@^1.5.1")
          ];
        "conventional-changelog-angular@^5.0.0" = s."conventional-changelog-angular@5.0.11";
        "conventional-changelog-writer@4.0.17" = f "conventional-changelog-writer" "4.0.17" y "4753aaa138bf5aa59c0b274cb5937efcd2722e21" [
          (s."compare-func@^2.0.0")
          (s."conventional-commits-filter@^2.0.6")
          (s."dateformat@^3.0.0")
          (s."handlebars@^4.7.6")
          (s."json-stringify-safe@^5.0.1")
          (s."lodash@^4.17.15")
          (s."meow@^7.0.0")
          (s."semver@^6.0.0")
          (s."split@^1.0.0")
          (s."through2@^3.0.0")
          ];
        "conventional-changelog-writer@^4.0.0" = s."conventional-changelog-writer@4.0.17";
        "conventional-commits-filter@2.0.6" = f "conventional-commits-filter" "2.0.6" y "0935e1240c5ca7698329affee1b6a46d33324c4c" [
          (s."lodash.ismatch@^4.4.0")
          (s."modify-values@^1.0.0")
          ];
        "conventional-commits-filter@^2.0.0" = s."conventional-commits-filter@2.0.6";
        "conventional-commits-filter@^2.0.6" = s."conventional-commits-filter@2.0.6";
        "conventional-commits-parser@3.1.0" = f "conventional-commits-parser" "3.1.0" y "10140673d5e7ef5572633791456c5d03b69e8be4" [
          (s."JSONStream@^1.0.4")
          (s."is-text-path@^1.0.1")
          (s."lodash@^4.17.15")
          (s."meow@^7.0.0")
          (s."split2@^2.0.0")
          (s."through2@^3.0.0")
          (s."trim-off-newlines@^1.0.0")
          ];
        "conventional-commits-parser@^3.0.0" = s."conventional-commits-parser@3.1.0";
        "conventional-commits-parser@^3.0.7" = s."conventional-commits-parser@3.1.0";
        "convert-source-map@1.7.0" = f "convert-source-map" "1.7.0" y "17a2cb882d7f77d3490585e2ce6c524424a3a442" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.5.1" = s."convert-source-map@1.7.0";
        "cookie-signature@1.0.6" = f "cookie-signature" "1.0.6" y "e303a882b342cc3ee8ca513a79999734dab3ae2c" [];
        "cookie@0.4.0" = f "cookie" "0.4.0" y "beb437e7022b3b6d49019d088665303ebe9c14ba" [];
        "cookiejar@2.1.2" = f "cookiejar" "2.1.2" y "dd8a235530752f988f9a0844f3fc589e3111125c" [];
        "cookiejar@^2.1.1" = s."cookiejar@2.1.2";
        "copy-concurrently@1.0.5" = f "copy-concurrently" "1.0.5" y "92297398cae34937fcafd6ec8139c18051f0b5e0" [
          (s."aproba@^1.1.1")
          (s."fs-write-stream-atomic@^1.0.8")
          (s."iferr@^0.1.5")
          (s."mkdirp@^0.5.1")
          (s."rimraf@^2.5.4")
          (s."run-queue@^1.0.0")
          ];
        "copy-concurrently@^1.0.0" = s."copy-concurrently@1.0.5";
        "copy-descriptor@0.1.1" = f "copy-descriptor" "0.1.1" y "676f6eb3c39997c2ee1ac3a924fd6124748f578d" [];
        "copy-descriptor@^0.1.0" = s."copy-descriptor@0.1.1";
        "core-js-pure@3.6.5" = f "core-js-pure" "3.6.5" y "c79e75f5e38dbc85a662d91eea52b8256d53b813" [];
        "core-js-pure@^3.0.1" = s."core-js-pure@3.6.5";
        "core-js@2.6.11" = f "core-js" "2.6.11" y "38831469f9922bded8ee21c9dc46985e0399308c" [];
        "core-js@^2.4.0" = s."core-js@2.6.11";
        "core-js@^2.5.0" = s."core-js@2.6.11";
        "core-util-is@1.0.2" = f "core-util-is" "1.0.2" y "b5fd54220aa2bc5ab57aab7140c940754503c1a7" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.2";
        "cors@2.8.5" = f "cors" "2.8.5" y "eac11da51592dd86b9f06f6e7ac293b3df875d29" [
          (s."object-assign@^4")
          (s."vary@^1")
          ];
        "cors@^2.8.1" = s."cors@2.8.5";
        "cosmiconfig@6.0.0" = f "cosmiconfig" "6.0.0" y "da4fee853c52f6b1e6935f41c1a2fc50bd4a9982" [
          (s."@types/parse-json@^4.0.0")
          (s."import-fresh@^3.1.0")
          (s."parse-json@^5.0.0")
          (s."path-type@^4.0.0")
          (s."yaml@^1.7.2")
          ];
        "cosmiconfig@^6.0.0" = s."cosmiconfig@6.0.0";
        "create-ecdh@4.0.4" = f "create-ecdh" "4.0.4" y "d6e7f4bffa66736085a0762fd3a632684dabcc4e" [
          (s."bn.js@^4.1.0")
          (s."elliptic@^6.5.3")
          ];
        "create-ecdh@^4.0.0" = s."create-ecdh@4.0.4";
        "create-error-class@3.0.2" = f "create-error-class" "3.0.2" y "06be7abef947a3f14a30fd610671d401bca8b7b6" [
          (s."capture-stack-trace@^1.0.0")
          ];
        "create-error-class@^3.0.0" = s."create-error-class@3.0.2";
        "create-hash@1.2.0" = f "create-hash" "1.2.0" y "889078af11a63756bcfb59bd221996be3a9ef196" [
          (s."cipher-base@^1.0.1")
          (s."inherits@^2.0.1")
          (s."md5.js@^1.3.4")
          (s."ripemd160@^2.0.1")
          (s."sha.js@^2.4.0")
          ];
        "create-hash@^1.1.0" = s."create-hash@1.2.0";
        "create-hash@^1.1.2" = s."create-hash@1.2.0";
        "create-hash@^1.2.0" = s."create-hash@1.2.0";
        "create-hmac@1.1.7" = f "create-hmac" "1.1.7" y "69170c78b3ab957147b2b8b04572e47ead2243ff" [
          (s."cipher-base@^1.0.3")
          (s."create-hash@^1.1.0")
          (s."inherits@^2.0.1")
          (s."ripemd160@^2.0.0")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "create-hmac@^1.1.0" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.4" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.7" = s."create-hmac@1.1.7";
        "cross-fetch@2.2.3" = f "cross-fetch" "2.2.3" y "e8a0b3c54598136e037f8650f8e823ccdfac198e" [
          (s."node-fetch@2.1.2")
          (s."whatwg-fetch@2.0.4")
          ];
        "cross-fetch@^2.1.0" = s."cross-fetch@2.2.3";
        "cross-fetch@^2.1.1" = s."cross-fetch@2.2.3";
        "cross-spawn@5.1.0" = f "cross-spawn" "5.1.0" y "e8bd0efee58fcff6f8f94510a0a554bbfa235449" [
          (s."lru-cache@^4.0.1")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@6.0.5" = f "cross-spawn" "6.0.5" y "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4" [
          (s."nice-try@^1.0.4")
          (s."path-key@^2.0.1")
          (s."semver@^5.5.0")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@7.0.3" = f "cross-spawn" "7.0.3" y "f73a85b9d5d41d045551c177e2882d4ac85728a6" [
          (s."path-key@^3.1.0")
          (s."shebang-command@^2.0.0")
          (s."which@^2.0.1")
          ];
        "cross-spawn@^5.0.1" = s."cross-spawn@5.1.0";
        "cross-spawn@^6.0.0" = s."cross-spawn@6.0.5";
        "cross-spawn@^6.0.5" = s."cross-spawn@6.0.5";
        "cross-spawn@^7.0.0" = s."cross-spawn@7.0.3";
        "crypto-browserify@3.12.0" = f "crypto-browserify" "3.12.0" y "396cf9f3137f03e4b8e532c58f698254e00f80ec" [
          (s."browserify-cipher@^1.0.0")
          (s."browserify-sign@^4.0.0")
          (s."create-ecdh@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.0")
          (s."diffie-hellman@^5.0.0")
          (s."inherits@^2.0.1")
          (s."pbkdf2@^3.0.3")
          (s."public-encrypt@^4.0.0")
          (s."randombytes@^2.0.0")
          (s."randomfill@^1.0.3")
          ];
        "crypto-browserify@^3.11.0" = s."crypto-browserify@3.12.0";
        "crypto-random-string@1.0.0" = f "crypto-random-string" "1.0.0" y "a230f64f568310e1498009940790ec99545bca7e" [];
        "crypto-random-string@2.0.0" = f "crypto-random-string" "2.0.0" y "ef2a7a966ec11083388369baa02ebead229b30d5" [];
        "crypto-random-string@^1.0.0" = s."crypto-random-string@1.0.0";
        "crypto-random-string@^2.0.0" = s."crypto-random-string@2.0.0";
        "cyclist@0.2.2" = f "cyclist" "0.2.2" y "1b33792e11e914a2fd6d6ed6447464444e5fa640" [];
        "cyclist@~0.2.2" = s."cyclist@0.2.2";
        "d@1" = s."d@1.0.1";
        "d@1.0.1" = f "d" "1.0.1" y "8698095372d58dbee346ffd0c7093f99f8f9eb5a" [
          (s."type@^1.0.1")
          ];
        "d@^1.0.1" = s."d@1.0.1";
        "dashdash@1.14.1" = f "dashdash" "1.14.1" y "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0" [
          (s."assert-plus@^1.0.0")
          ];
        "dashdash@^1.12.0" = s."dashdash@1.14.1";
        "dateformat@3.0.3" = f "dateformat" "3.0.3" y "a6e37499a4d9a9cf85ef5872044d62901c9889ae" [];
        "dateformat@^3.0.0" = s."dateformat@3.0.3";
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
          ];
        "debug@3.1.0" = f "debug" "3.1.0" y "5bb5a0672628b64149566ba16819e61518c67261" [
          (s."ms@2.0.0")
          ];
        "debug@3.2.6" = f "debug" "3.2.6" y "e83d17de16d8a7efb7717edbe5fb10135eee629b" [
          (s."ms@^2.1.1")
          ];
        "debug@4" = s."debug@4.2.0";
        "debug@4.2.0" = f "debug" "4.2.0" y "7f150f93920e94c58f5574c2fd01a3110effe7f1" [
          (s."ms@2.1.2")
          ];
        "debug@^2.2.0" = s."debug@2.6.9";
        "debug@^2.3.3" = s."debug@2.6.9";
        "debug@^2.6.8" = s."debug@2.6.9";
        "debug@^2.6.9" = s."debug@2.6.9";
        "debug@^3.1.0" = s."debug@3.1.0";
        "debug@^4.0.0" = s."debug@4.2.0";
        "debuglog@*" = s."debuglog@1.0.1";
        "debuglog@1.0.1" = f "debuglog" "1.0.1" y "aa24ffb9ac3df9a2351837cfb2d279360cd78492" [];
        "debuglog@^1.0.1" = s."debuglog@1.0.1";
        "decamelize-keys@1.1.0" = f "decamelize-keys" "1.1.0" y "d171a87933252807eb3cb61dc1c1445d078df2d9" [
          (s."decamelize@^1.1.0")
          (s."map-obj@^1.0.0")
          ];
        "decamelize-keys@^1.1.0" = s."decamelize-keys@1.1.0";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.1.0" = s."decamelize@1.2.0";
        "decamelize@^1.2.0" = s."decamelize@1.2.0";
        "decode-uri-component@0.2.0" = f "decode-uri-component" "0.2.0" y "eb3913333458775cb84cd1a1fae062106bb87545" [];
        "decode-uri-component@^0.2.0" = s."decode-uri-component@0.2.0";
        "decompress-response@3.3.0" = f "decompress-response" "3.3.0" y "80a4dd323748384bfa248083622aedec982adff3" [
          (s."mimic-response@^1.0.0")
          ];
        "decompress-response@^3.2.0" = s."decompress-response@3.3.0";
        "decompress-response@^3.3.0" = s."decompress-response@3.3.0";
        "deep-equal@1.1.1" = f "deep-equal" "1.1.1" y "b5c98c942ceffaf7cb051e24e1434a25a2e6076a" [
          (s."is-arguments@^1.0.4")
          (s."is-date-object@^1.0.1")
          (s."is-regex@^1.0.4")
          (s."object-is@^1.0.1")
          (s."object-keys@^1.1.1")
          (s."regexp.prototype.flags@^1.2.0")
          ];
        "deep-equal@~1.1.1" = s."deep-equal@1.1.1";
        "deep-extend@0.6.0" = f "deep-extend" "0.6.0" y "c4fa7c95404a17a9c3e8ca7e1537312b736330ac" [];
        "deep-extend@^0.6.0" = s."deep-extend@0.6.0";
        "defaults@1.0.3" = f "defaults" "1.0.3" y "c656051e9817d9ff08ed881477f3fe4019f3ef7d" [
          (s."clone@^1.0.2")
          ];
        "defaults@^1.0.3" = s."defaults@1.0.3";
        "defer-to-connect@1.1.3" = f "defer-to-connect" "1.1.3" y "331ae050c08dcf789f8c83a7b81f0ed94f4ac591" [];
        "defer-to-connect@^1.0.1" = s."defer-to-connect@1.1.3";
        "deferred-leveldown@1.2.2" = f "deferred-leveldown" "1.2.2" y "3acd2e0b75d1669924bc0a4b642851131173e1eb" [
          (s."abstract-leveldown@~2.6.0")
          ];
        "deferred-leveldown@4.0.2" = f "deferred-leveldown" "4.0.2" y "0b0570087827bf480a23494b398f04c128c19a20" [
          (s."abstract-leveldown@~5.0.0")
          (s."inherits@^2.0.3")
          ];
        "deferred-leveldown@~1.2.1" = s."deferred-leveldown@1.2.2";
        "deferred-leveldown@~4.0.0" = s."deferred-leveldown@4.0.2";
        "define-properties@1.1.3" = f "define-properties" "1.1.3" y "cf88da6cbee26fe6db7094f61d870cbd84cee9f1" [
          (s."object-keys@^1.0.12")
          ];
        "define-properties@^1.1.2" = s."define-properties@1.1.3";
        "define-properties@^1.1.3" = s."define-properties@1.1.3";
        "define-property@0.2.5" = f "define-property" "0.2.5" y "c35b1ef918ec3c990f9a5bc57be04aacec5c8116" [
          (s."is-descriptor@^0.1.0")
          ];
        "define-property@1.0.0" = f "define-property" "1.0.0" y "769ebaaf3f4a63aad3af9e8d304c9bbe79bfb0e6" [
          (s."is-descriptor@^1.0.0")
          ];
        "define-property@2.0.2" = f "define-property" "2.0.2" y "d459689e8d654ba77e02a817f8710d702cb16e9d" [
          (s."is-descriptor@^1.0.2")
          (s."isobject@^3.0.1")
          ];
        "define-property@^0.2.5" = s."define-property@0.2.5";
        "define-property@^1.0.0" = s."define-property@1.0.0";
        "define-property@^2.0.2" = s."define-property@2.0.2";
        "defined@1.0.0" = f "defined" "1.0.0" y "c98d9bcef75674188e110969151199e39b1fa693" [];
        "defined@~1.0.0" = s."defined@1.0.0";
        "delayed-stream@1.0.0" = f "delayed-stream" "1.0.0" y "df3ae199acadfb7d440aaae0b29e2272b24ec619" [];
        "delayed-stream@~1.0.0" = s."delayed-stream@1.0.0";
        "delegates@1.0.0" = f "delegates" "1.0.0" y "84c6e159b81904fdca59a0ef44cd870d31250f9a" [];
        "delegates@^1.0.0" = s."delegates@1.0.0";
        "depd@1.1.2" = f "depd" "1.1.2" y "9bcd52e14c097763e749b274c4346ed2e560b5a9" [];
        "depd@~1.1.2" = s."depd@1.1.2";
        "deprecation@2.3.1" = f "deprecation" "2.3.1" y "6368cbdb40abf3373b525ac87e4a260c3a700919" [];
        "deprecation@^2.0.0" = s."deprecation@2.3.1";
        "deprecation@^2.3.1" = s."deprecation@2.3.1";
        "des.js@1.0.1" = f "des.js" "1.0.1" y "5382142e1bdc53f85d86d53e5f4aa7deb91e0843" [
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          ];
        "des.js@^1.0.0" = s."des.js@1.0.1";
        "destroy@1.0.4" = f "destroy" "1.0.4" y "978857442c44749e4206613e37946205826abd80" [];
        "destroy@~1.0.4" = s."destroy@1.0.4";
        "detect-file@1.0.0" = f "detect-file" "1.0.0" y "f0d66d03672a825cb1b73bdb3fe62310c8e552b7" [];
        "detect-file@^1.0.0" = s."detect-file@1.0.0";
        "detect-indent@4.0.0" = f "detect-indent" "4.0.0" y "f76d064352cdf43a1cb6ce619c4ee3a9475de208" [
          (s."repeating@^2.0.0")
          ];
        "detect-indent@5.0.0" = f "detect-indent" "5.0.0" y "3871cc0a6a002e8c3e5b3cf7f336264675f06b9d" [];
        "detect-indent@^4.0.0" = s."detect-indent@4.0.0";
        "detect-indent@~5.0.0" = s."detect-indent@5.0.0";
        "detect-newline@2.1.0" = f "detect-newline" "2.1.0" y "f41f1c10be4b00e87b5f13da680759f2c5bfd3e2" [];
        "detect-newline@^2.1.0" = s."detect-newline@2.1.0";
        "dezalgo@1.0.3" = f "dezalgo" "1.0.3" y "7f742de066fc748bc8db820569dddce49bf0d456" [
          (s."asap@^2.0.0")
          (s."wrappy@1")
          ];
        "dezalgo@^1.0.0" = s."dezalgo@1.0.3";
        "dezalgo@~1.0.3" = s."dezalgo@1.0.3";
        "diffie-hellman@5.0.3" = f "diffie-hellman" "5.0.3" y "40e8ee98f55a2149607146921c63e1ae5f3d2875" [
          (s."bn.js@^4.1.0")
          (s."miller-rabin@^4.0.0")
          (s."randombytes@^2.0.0")
          ];
        "diffie-hellman@^5.0.0" = s."diffie-hellman@5.0.3";
        "dir-glob@3.0.1" = f "dir-glob" "3.0.1" y "56dbf73d992a4a93ba1584f4534063fd2e41717f" [
          (s."path-type@^4.0.0")
          ];
        "dir-glob@^3.0.0" = s."dir-glob@3.0.1";
        "dir-glob@^3.0.1" = s."dir-glob@3.0.1";
        "dom-walk@0.1.2" = f "dom-walk" "0.1.2" y "0c548bef048f4d1f2a97249002236060daa3fd84" [];
        "dom-walk@^0.1.0" = s."dom-walk@0.1.2";
        "domain-browser@1.2.0" = f "domain-browser" "1.2.0" y "3d31f50191a6749dd1375a7f522e823d42e54eda" [];
        "domain-browser@^1.1.1" = s."domain-browser@1.2.0";
        "dot-prop@4.2.1" = f "dot-prop" "4.2.1" y "45884194a71fc2cda71cbb4bceb3a4dd2f433ba4" [
          (s."is-obj@^1.0.0")
          ];
        "dot-prop@5.3.0" = f "dot-prop" "5.3.0" y "90ccce708cd9cd82cc4dc8c3ddd9abdd55b20e88" [
          (s."is-obj@^2.0.0")
          ];
        "dot-prop@^4.2.1" = s."dot-prop@4.2.1";
        "dot-prop@^5.1.0" = s."dot-prop@5.3.0";
        "dotenv@5.0.1" = f "dotenv" "5.0.1" y "a5317459bd3d79ab88cff6e44057a6a3fbb1fcef" [];
        "dotenv@^5.0.1" = s."dotenv@5.0.1";
        "dotignore@0.1.2" = f "dotignore" "0.1.2" y "f942f2200d28c3a76fbdd6f0ee9f3257c8a2e905" [
          (s."minimatch@^3.0.4")
          ];
        "dotignore@~0.1.2" = s."dotignore@0.1.2";
        "duplexer2@0.1.4" = f "duplexer2" "0.1.4" y "8b12dab878c0d69e3e7891051662a32fc6bddcc1" [
          (s."readable-stream@^2.0.2")
          ];
        "duplexer2@~0.1.0" = s."duplexer2@0.1.4";
        "duplexer3@0.1.4" = f "duplexer3" "0.1.4" y "ee01dd1cac0ed3cbc7fdbea37dc0a8f1ce002ce2" [];
        "duplexer3@^0.1.4" = s."duplexer3@0.1.4";
        "duplexify@3.6.0" = f "duplexify" "3.6.0" y "592903f5d80b38d037220541264d69a198fb3410" [
          (s."end-of-stream@^1.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.0")
          (s."stream-shift@^1.0.0")
          ];
        "duplexify@^3.4.2" = s."duplexify@3.6.0";
        "duplexify@^3.6.0" = s."duplexify@3.6.0";
        "ecc-jsbn@0.1.2" = f "ecc-jsbn" "0.1.2" y "3a83a904e54353287874c564b7549386849a98c9" [
          (s."jsbn@~0.1.0")
          (s."safer-buffer@^2.1.0")
          ];
        "ecc-jsbn@~0.1.1" = s."ecc-jsbn@0.1.2";
        "editor@1.0.0" = f "editor" "1.0.0" y "60c7f87bd62bcc6a894fa8ccd6afb7823a24f742" [];
        "editor@~1.0.0" = s."editor@1.0.0";
        "ee-first@1.1.1" = f "ee-first" "1.1.1" y "590c61156b0ae2f4f0255732a158b266bc56b21d" [];
        "electron-to-chromium@1.3.578" = f "electron-to-chromium" "1.3.578" y "e6671936f4571a874eb26e2e833aa0b2c0b776e0" [];
        "electron-to-chromium@^1.3.47" = s."electron-to-chromium@1.3.578";
        "elliptic@6.5.3" = f "elliptic" "6.5.3" y "cb59eb2efdaf73a0bd78ccd7015a62ad6e0f93d6" [
          (s."bn.js@^4.4.0")
          (s."brorand@^1.0.1")
          (s."hash.js@^1.0.0")
          (s."hmac-drbg@^1.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.0")
          ];
        "elliptic@^6.4.0" = s."elliptic@6.5.3";
        "elliptic@^6.5.2" = s."elliptic@6.5.3";
        "elliptic@^6.5.3" = s."elliptic@6.5.3";
        "emoji-regex@7.0.3" = f "emoji-regex" "7.0.3" y "933a04052860c85e83c122479c4748a8e4c72156" [];
        "emoji-regex@8.0.0" = f "emoji-regex" "8.0.0" y "e818fd69ce5ccfcb404594f842963bf53164cc37" [];
        "emoji-regex@^7.0.1" = s."emoji-regex@7.0.3";
        "emoji-regex@^8.0.0" = s."emoji-regex@8.0.0";
        "emojis-list@3.0.0" = f "emojis-list" "3.0.0" y "5570662046ad29e2e916e71aae260abdff4f6a78" [];
        "emojis-list@^3.0.0" = s."emojis-list@3.0.0";
        "encodeurl@1.0.2" = f "encodeurl" "1.0.2" y "ad3ff4c86ec2d029322f5a02c3a9a606c95b3f59" [];
        "encodeurl@~1.0.2" = s."encodeurl@1.0.2";
        "encoding-down@5.0.4" = f "encoding-down" "5.0.4" y "1e477da8e9e9d0f7c8293d320044f8b2cd8e9614" [
          (s."abstract-leveldown@^5.0.0")
          (s."inherits@^2.0.3")
          (s."level-codec@^9.0.0")
          (s."level-errors@^2.0.0")
          (s."xtend@^4.0.1")
          ];
        "encoding-down@~5.0.0" = s."encoding-down@5.0.4";
        "encoding@0.1.12" = f "encoding" "0.1.12" y "538b66f3ee62cd1ab51ec323829d1f9480c74beb" [
          (s."iconv-lite@~0.4.13")
          ];
        "encoding@^0.1.11" = s."encoding@0.1.12";
        "end-of-stream@1.4.1" = f "end-of-stream" "1.4.1" y "ed29634d19baba463b6ce6b80a37213eab71ec43" [
          (s."once@^1.4.0")
          ];
        "end-of-stream@^1.0.0" = s."end-of-stream@1.4.1";
        "end-of-stream@^1.1.0" = s."end-of-stream@1.4.1";
        "enhanced-resolve@4.3.0" = f "enhanced-resolve" "4.3.0" y "3b806f3bfafc1ec7de69551ef93cca46c1704126" [
          (s."graceful-fs@^4.1.2")
          (s."memory-fs@^0.5.0")
          (s."tapable@^1.0.0")
          ];
        "enhanced-resolve@^4.1.0" = s."enhanced-resolve@4.3.0";
        "enhanced-resolve@^4.1.1" = s."enhanced-resolve@4.3.0";
        "env-ci@5.0.2" = f "env-ci" "5.0.2" y "48b6687f8af8cdf5e31b8fcf2987553d085249d9" [
          (s."execa@^4.0.0")
          (s."java-properties@^1.0.0")
          ];
        "env-ci@^5.0.0" = s."env-ci@5.0.2";
        "env-paths@2.2.0" = f "env-paths" "2.2.0" y "cdca557dc009152917d6166e2febe1f039685e43" [];
        "env-paths@^2.2.0" = s."env-paths@2.2.0";
        "err-code@1.1.2" = f "err-code" "1.1.2" y "06e0116d3028f6aef4806849eb0ea6a748ae6960" [];
        "err-code@^1.0.0" = s."err-code@1.1.2";
        "errno@0.1.7" = f "errno" "0.1.7" y "4684d71779ad39af177e3f007996f7c67c852618" [
          (s."prr@~1.0.1")
          ];
        "errno@^0.1.3" = s."errno@0.1.7";
        "errno@~0.1.1" = s."errno@0.1.7";
        "errno@~0.1.7" = s."errno@0.1.7";
        "error-ex@1.3.2" = f "error-ex" "1.3.2" y "b4ac40648107fdcdcfae242f428bea8a14d4f1bf" [
          (s."is-arrayish@^0.2.1")
          ];
        "error-ex@^1.3.1" = s."error-ex@1.3.2";
        "es-abstract@1.12.0" = f "es-abstract" "1.12.0" y "9dbbdd27c6856f0001421ca18782d786bf8a6165" [
          (s."es-to-primitive@^1.1.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.1")
          (s."is-callable@^1.1.3")
          (s."is-regex@^1.0.4")
          ];
        "es-abstract@1.17.7" = f "es-abstract" "1.17.7" y "a4de61b2f66989fc7421676c1cb9787573ace54c" [
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.1")
          (s."is-callable@^1.2.2")
          (s."is-regex@^1.1.1")
          (s."object-inspect@^1.8.0")
          (s."object-keys@^1.1.1")
          (s."string.prototype.trimstart@^1.0.1")
          ];
        "es-abstract@1.18.0-next.1" = f "es-abstract" "1.18.0-next.1" y "6e3a0a4bda717e5023ab3b8e90bec36108d22c68" [
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.1")
          (s."is-callable@^1.2.2")
          (s."is-negative-zero@^2.0.0")
          (s."is-regex@^1.1.1")
          (s."object-inspect@^1.8.0")
          (s."object-keys@^1.1.1")
          (s."string.prototype.trimend@^1.0.1")
          (s."string.prototype.trimstart@^1.0.1")
          ];
        "es-abstract@^1.17.0-next.1" = s."es-abstract@1.17.7";
        "es-abstract@^1.17.2" = s."es-abstract@1.17.7";
        "es-abstract@^1.17.5" = s."es-abstract@1.17.7";
        "es-abstract@^1.18.0-next.0" = s."es-abstract@1.18.0-next.1";
        "es-abstract@^1.18.0-next.1" = s."es-abstract@1.18.0-next.1";
        "es-abstract@^1.5.1" = s."es-abstract@1.12.0";
        "es-to-primitive@1.2.0" = f "es-to-primitive" "1.2.0" y "edf72478033456e8dda8ef09e00ad9650707f377" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@1.2.1" = f "es-to-primitive" "1.2.1" y "e55cd4c9cdc188bcefb03b366c736323fc5c898a" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@^1.1.1" = s."es-to-primitive@1.2.0";
        "es-to-primitive@^1.2.1" = s."es-to-primitive@1.2.1";
        "es5-ext@0.10.53" = f "es5-ext" "0.10.53" y "93c5a3acfdbef275220ad72644ad02ee18368de1" [
          (s."es6-symbol@~3.1.3")
          (s."next-tick@~1.0.0")
          ];
        "es5-ext@^0.10.35" = s."es5-ext@0.10.53";
        "es5-ext@^0.10.50" = s."es5-ext@0.10.53";
        "es6-iterator@2.0.3" = f "es6-iterator" "2.0.3" y "a7de889141a05a94b0854403b2d0a0fbfa98f3b7" [
          (s."es5-ext@^0.10.35")
          (s."es6-symbol@^3.1.1")
          ];
        "es6-iterator@~2.0.3" = s."es6-iterator@2.0.3";
        "es6-promise@4.2.8" = f "es6-promise" "4.2.8" y "4eb21594c972bc40553d276e510539143db53e0a" [];
        "es6-promise@^4.0.3" = s."es6-promise@4.2.8";
        "es6-promisify@5.0.0" = f "es6-promisify" "5.0.0" y "5109d62f3e56ea967c4b63505aef08291c8a5203" [
          (s."es6-promise@^4.0.3")
          ];
        "es6-promisify@^5.0.0" = s."es6-promisify@5.0.0";
        "es6-symbol@3.1.3" = f "es6-symbol" "3.1.3" y "bad5d3c1bcdac28269f4cb331e431c78ac705d18" [
          (s."d@^1.0.1")
          (s."ext@^1.1.2")
          ];
        "es6-symbol@^3.1.1" = s."es6-symbol@3.1.3";
        "es6-symbol@~3.1.3" = s."es6-symbol@3.1.3";
        "escape-html@1.0.3" = f "escape-html" "1.0.3" y "0258eae4d3d0c0974de1c169188ef0051d1d1988" [];
        "escape-html@~1.0.3" = s."escape-html@1.0.3";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@^1.0.2" = s."escape-string-regexp@1.0.5";
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "eslint-scope@4.0.3" = f "eslint-scope" "4.0.3" y "ca03833310f6889a3264781aa82e63eb9cfe7848" [
          (s."esrecurse@^4.1.0")
          (s."estraverse@^4.1.1")
          ];
        "eslint-scope@^4.0.3" = s."eslint-scope@4.0.3";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@~4.0.0" = s."esprima@4.0.1";
        "esrecurse@4.3.0" = f "esrecurse" "4.3.0" y "7ad7964d679abb28bee72cec63758b1c5d2c9921" [
          (s."estraverse@^5.2.0")
          ];
        "esrecurse@^4.1.0" = s."esrecurse@4.3.0";
        "estraverse@4.3.0" = f "estraverse" "4.3.0" y "398ad3f3c5a24948be7725e83d11a7de28cdbd1d" [];
        "estraverse@5.2.0" = f "estraverse" "5.2.0" y "307df42547e6cc7324d3cf03c155d5cdb8c53880" [];
        "estraverse@^4.1.1" = s."estraverse@4.3.0";
        "estraverse@^5.2.0" = s."estraverse@5.2.0";
        "esutils@2.0.3" = f "esutils" "2.0.3" y "74d2eb4de0b8da1293711910d50775b9b710ef64" [];
        "esutils@^2.0.2" = s."esutils@2.0.3";
        "etag@1.8.1" = f "etag" "1.8.1" y "41ae2eeb65efa62268aebfea83ac7d79299b0887" [];
        "etag@~1.8.1" = s."etag@1.8.1";
        "eth-block-tracker@3.0.1" = f "eth-block-tracker" "3.0.1" y "95cd5e763c7293e0b1b2790a2a39ac2ac188a5e1" [
          (s."eth-query@^2.1.0")
          (s."ethereumjs-tx@^1.3.3")
          (s."ethereumjs-util@^5.1.3")
          (s."ethjs-util@^0.1.3")
          (s."json-rpc-engine@^3.6.0")
          (s."pify@^2.3.0")
          (s."tape@^4.6.3")
          ];
        "eth-block-tracker@^3.0.0" = s."eth-block-tracker@3.0.1";
        "eth-ens-namehash@2.0.8" = f "eth-ens-namehash" "2.0.8" y "229ac46eca86d52e0c991e7cb2aef83ff0f68bcf" [
          (s."idna-uts46-hx@^2.3.1")
          (s."js-sha3@^0.5.7")
          ];
        "eth-json-rpc-infura@3.2.1" = f "eth-json-rpc-infura" "3.2.1" y "26702a821067862b72d979c016fd611502c6057f" [
          (s."cross-fetch@^2.1.1")
          (s."eth-json-rpc-middleware@^1.5.0")
          (s."json-rpc-engine@^3.4.0")
          (s."json-rpc-error@^2.0.0")
          ];
        "eth-json-rpc-infura@^3.1.0" = s."eth-json-rpc-infura@3.2.1";
        "eth-json-rpc-middleware@1.6.0" = f "eth-json-rpc-middleware" "1.6.0" y "5c9d4c28f745ccb01630f0300ba945f4bef9593f" [
          (s."async@^2.5.0")
          (s."eth-query@^2.1.2")
          (s."eth-tx-summary@^3.1.2")
          (s."ethereumjs-block@^1.6.0")
          (s."ethereumjs-tx@^1.3.3")
          (s."ethereumjs-util@^5.1.2")
          (s."ethereumjs-vm@^2.1.0")
          (s."fetch-ponyfill@^4.0.0")
          (s."json-rpc-engine@^3.6.0")
          (s."json-rpc-error@^2.0.0")
          (s."json-stable-stringify@^1.0.1")
          (s."promise-to-callback@^1.0.0")
          (s."tape@^4.6.3")
          ];
        "eth-json-rpc-middleware@^1.5.0" = s."eth-json-rpc-middleware@1.6.0";
        "eth-lib@0.1.29" = f "eth-lib" "0.1.29" y "0c11f5060d42da9f931eab6199084734f4dbd1d9" [
          (s."bn.js@^4.11.6")
          (s."elliptic@^6.4.0")
          (s."nano-json-stream-parser@^0.1.2")
          (s."servify@^0.1.12")
          (s."ws@^3.0.0")
          (s."xhr-request-promise@^0.1.2")
          ];
        "eth-lib@0.2.8" = f "eth-lib" "0.2.8" y "b194058bef4b220ad12ea497431d6cb6aa0623c8" [
          (s."bn.js@^4.11.6")
          (s."elliptic@^6.4.0")
          (s."xhr-request-promise@^0.1.2")
          ];
        "eth-lib@^0.1.26" = s."eth-lib@0.1.29";
        "eth-query@2.1.2" = f "eth-query" "2.1.2" y "d6741d9000106b51510c72db92d6365456a6da5e" [
          (s."json-rpc-random-id@^1.0.0")
          (s."xtend@^4.0.1")
          ];
        "eth-query@^2.0.2" = s."eth-query@2.1.2";
        "eth-query@^2.1.0" = s."eth-query@2.1.2";
        "eth-query@^2.1.2" = s."eth-query@2.1.2";
        "eth-sig-util@1.4.2" = f "eth-sig-util" "1.4.2" y "8d958202c7edbaae839707fba6f09ff327606210" [
          (s."ethereumjs-abi@git+https://github.com/ethereumjs/ethereumjs-abi.git")
          (s."ethereumjs-util@^5.1.1")
          ];
        "eth-sig-util@2.3.0" = f "eth-sig-util" "2.3.0" y "c54a6ac8e8796f7e25f59cf436982a930e645231" [
          (s."buffer@^5.2.1")
          (s."elliptic@^6.4.0")
          (s."ethereumjs-abi@0.6.5")
          (s."ethereumjs-util@^5.1.1")
          (s."tweetnacl@^1.0.0")
          (s."tweetnacl-util@^0.15.0")
          ];
        "eth-sig-util@^1.4.2" = s."eth-sig-util@1.4.2";
        "eth-sig-util@^2.0.0" = s."eth-sig-util@2.3.0";
        "eth-tx-summary@3.2.4" = f "eth-tx-summary" "3.2.4" y "e10eb95eb57cdfe549bf29f97f1e4f1db679035c" [
          (s."async@^2.1.2")
          (s."clone@^2.0.0")
          (s."concat-stream@^1.5.1")
          (s."end-of-stream@^1.1.0")
          (s."eth-query@^2.0.2")
          (s."ethereumjs-block@^1.4.1")
          (s."ethereumjs-tx@^1.1.1")
          (s."ethereumjs-util@^5.0.1")
          (s."ethereumjs-vm@^2.6.0")
          (s."through2@^2.0.3")
          ];
        "eth-tx-summary@^3.1.2" = s."eth-tx-summary@3.2.4";
        "ethashjs@0.0.8" = f "ethashjs" "0.0.8" y "227442f1bdee409a548fb04136e24c874f3aa6f9" [
          (s."async@^2.1.2")
          (s."buffer-xor@^2.0.1")
          (s."ethereumjs-util@^7.0.2")
          (s."miller-rabin@^4.0.0")
          ];
        "ethashjs@~0.0.7" = s."ethashjs@0.0.8";
        "ethereum-bloom-filters@1.0.7" = f "ethereum-bloom-filters" "1.0.7" y "b7b80735e385dbb7f944ce6b4533e24511306060" [
          (s."js-sha3@^0.8.0")
          ];
        "ethereum-bloom-filters@^1.0.6" = s."ethereum-bloom-filters@1.0.7";
        "ethereum-common@0.0.18" = f "ethereum-common" "0.0.18" y "2fdc3576f232903358976eb39da783213ff9523f" [];
        "ethereum-common@0.2.0" = f "ethereum-common" "0.2.0" y "13bf966131cce1eeade62a1b434249bb4cb120ca" [];
        "ethereum-common@^0.0.18" = s."ethereum-common@0.0.18";
        "ethereum-cryptography@0.1.3" = f "ethereum-cryptography" "0.1.3" y "8d6143cfc3d74bf79bbd8edecdf29e4ae20dd191" [
          (s."@types/pbkdf2@^3.0.0")
          (s."@types/secp256k1@^4.0.1")
          (s."blakejs@^1.1.0")
          (s."browserify-aes@^1.2.0")
          (s."bs58check@^2.1.2")
          (s."create-hash@^1.2.0")
          (s."create-hmac@^1.1.7")
          (s."hash.js@^1.1.7")
          (s."keccak@^3.0.0")
          (s."pbkdf2@^3.0.17")
          (s."randombytes@^2.1.0")
          (s."safe-buffer@^5.1.2")
          (s."scrypt-js@^3.0.0")
          (s."secp256k1@^4.0.1")
          (s."setimmediate@^1.0.5")
          ];
        "ethereum-cryptography@^0.1.3" = s."ethereum-cryptography@0.1.3";
        "ethereumjs-abi@0.6.5" = f "ethereumjs-abi" "0.6.5" y "5a637ef16ab43473fa72a29ad90871405b3f5241" [
          (s."bn.js@^4.10.0")
          (s."ethereumjs-util@^4.3.0")
          ];
        "ethereumjs-abi@0.6.8" = g "ethereumjs-abi" "0.6.8" "ssh://git@github.com/ethereumjs/ethereumjs-abi.git" "1ce6a1d64235fabe2aaf827fd606def55693508f" "0rm5xfpklv7270j2sypj743d2j029wnzr15vvml83rp8g2lm5ybn" [
          (s."bn.js@^4.11.8")
          (s."ethereumjs-util@^6.0.0")
          ];
        "ethereumjs-abi@git+https://github.com/ethereumjs/ethereumjs-abi.git" = s."ethereumjs-abi@0.6.8";
        "ethereumjs-account@2.0.5" = f "ethereumjs-account" "2.0.5" y "eeafc62de544cb07b0ee44b10f572c9c49e00a84" [
          (s."ethereumjs-util@^5.0.0")
          (s."rlp@^2.0.0")
          (s."safe-buffer@^5.1.1")
          ];
        "ethereumjs-account@3.0.0" = f "ethereumjs-account" "3.0.0" y "728f060c8e0c6e87f1e987f751d3da25422570a9" [
          (s."ethereumjs-util@^6.0.0")
          (s."rlp@^2.2.1")
          (s."safe-buffer@^5.1.1")
          ];
        "ethereumjs-account@^2.0.3" = s."ethereumjs-account@2.0.5";
        "ethereumjs-account@^3.0.0" = s."ethereumjs-account@3.0.0";
        "ethereumjs-block@1.7.1" = f "ethereumjs-block" "1.7.1" y "78b88e6cc56de29a6b4884ee75379b6860333c3f" [
          (s."async@^2.0.1")
          (s."ethereum-common@0.2.0")
          (s."ethereumjs-tx@^1.2.2")
          (s."ethereumjs-util@^5.0.0")
          (s."merkle-patricia-tree@^2.1.2")
          ];
        "ethereumjs-block@2.2.2" = f "ethereumjs-block" "2.2.2" y "c7654be7e22df489fda206139ecd63e2e9c04965" [
          (s."async@^2.0.1")
          (s."ethereumjs-common@^1.5.0")
          (s."ethereumjs-tx@^2.1.1")
          (s."ethereumjs-util@^5.0.0")
          (s."merkle-patricia-tree@^2.1.2")
          ];
        "ethereumjs-block@^1.2.2" = s."ethereumjs-block@1.7.1";
        "ethereumjs-block@^1.4.1" = s."ethereumjs-block@1.7.1";
        "ethereumjs-block@^1.6.0" = s."ethereumjs-block@1.7.1";
        "ethereumjs-block@^2.2.2" = s."ethereumjs-block@2.2.2";
        "ethereumjs-block@~2.2.0" = s."ethereumjs-block@2.2.2";
        "ethereumjs-block@~2.2.2" = s."ethereumjs-block@2.2.2";
        "ethereumjs-blockchain@4.0.4" = f "ethereumjs-blockchain" "4.0.4" y "30f2228dc35f6dcf94423692a6902604ae34960f" [
          (s."async@^2.6.1")
          (s."ethashjs@~0.0.7")
          (s."ethereumjs-block@~2.2.2")
          (s."ethereumjs-common@^1.5.0")
          (s."ethereumjs-util@^6.1.0")
          (s."flow-stoplight@^1.0.0")
          (s."level-mem@^3.0.1")
          (s."lru-cache@^5.1.1")
          (s."rlp@^2.2.2")
          (s."semaphore@^1.1.0")
          ];
        "ethereumjs-blockchain@^4.0.3" = s."ethereumjs-blockchain@4.0.4";
        "ethereumjs-common@1.5.0" = f "ethereumjs-common" "1.5.0" y "d3e82fc7c47c0cef95047f431a99485abc9bb1cd" [];
        "ethereumjs-common@^1.1.0" = s."ethereumjs-common@1.5.0";
        "ethereumjs-common@^1.3.2" = s."ethereumjs-common@1.5.0";
        "ethereumjs-common@^1.5.0" = s."ethereumjs-common@1.5.0";
        "ethereumjs-tx@1.3.7" = f "ethereumjs-tx" "1.3.7" y "88323a2d875b10549b8347e09f4862b546f3d89a" [
          (s."ethereum-common@^0.0.18")
          (s."ethereumjs-util@^5.0.0")
          ];
        "ethereumjs-tx@2.1.2" = f "ethereumjs-tx" "2.1.2" y "5dfe7688bf177b45c9a23f86cf9104d47ea35fed" [
          (s."ethereumjs-common@^1.5.0")
          (s."ethereumjs-util@^6.0.0")
          ];
        "ethereumjs-tx@^1.1.1" = s."ethereumjs-tx@1.3.7";
        "ethereumjs-tx@^1.2.0" = s."ethereumjs-tx@1.3.7";
        "ethereumjs-tx@^1.2.2" = s."ethereumjs-tx@1.3.7";
        "ethereumjs-tx@^1.3.3" = s."ethereumjs-tx@1.3.7";
        "ethereumjs-tx@^2.1.1" = s."ethereumjs-tx@2.1.2";
        "ethereumjs-tx@^2.1.2" = s."ethereumjs-tx@2.1.2";
        "ethereumjs-util@4.5.1" = f "ethereumjs-util" "4.5.1" y "f4bf9b3b515a484e3cc8781d61d9d980f7c83bd0" [
          (s."bn.js@^4.8.0")
          (s."create-hash@^1.1.2")
          (s."elliptic@^6.5.2")
          (s."ethereum-cryptography@^0.1.3")
          (s."rlp@^2.0.0")
          ];
        "ethereumjs-util@5.2.1" = f "ethereumjs-util" "5.2.1" y "a833f0e5fca7e5b361384dc76301a721f537bf65" [
          (s."bn.js@^4.11.0")
          (s."create-hash@^1.1.2")
          (s."elliptic@^6.5.2")
          (s."ethereum-cryptography@^0.1.3")
          (s."ethjs-util@^0.1.3")
          (s."rlp@^2.0.0")
          (s."safe-buffer@^5.1.1")
          ];
        "ethereumjs-util@6.2.1" = f "ethereumjs-util" "6.2.1" y "fcb4e4dd5ceacb9d2305426ab1a5cd93e3163b69" [
          (s."@types/bn.js@^4.11.3")
          (s."bn.js@^4.11.0")
          (s."create-hash@^1.1.2")
          (s."elliptic@^6.5.2")
          (s."ethereum-cryptography@^0.1.3")
          (s."ethjs-util@0.1.6")
          (s."rlp@^2.2.3")
          ];
        "ethereumjs-util@7.0.6" = f "ethereumjs-util" "7.0.6" y "ce4a6391a163cd1f2217b5276273f83bdacc7ab2" [
          (s."@types/bn.js@^4.11.3")
          (s."bn.js@^5.1.2")
          (s."create-hash@^1.1.2")
          (s."ethereum-cryptography@^0.1.3")
          (s."ethjs-util@0.1.6")
          (s."rlp@^2.2.4")
          ];
        "ethereumjs-util@^4.3.0" = s."ethereumjs-util@4.5.1";
        "ethereumjs-util@^5.0.0" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.0.1" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.1.1" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.1.2" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.1.3" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.1.5" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^5.2.0" = s."ethereumjs-util@5.2.1";
        "ethereumjs-util@^6.0.0" = s."ethereumjs-util@6.2.1";
        "ethereumjs-util@^6.1.0" = s."ethereumjs-util@6.2.1";
        "ethereumjs-util@^6.2.0" = s."ethereumjs-util@6.2.1";
        "ethereumjs-util@^7.0.2" = s."ethereumjs-util@7.0.6";
        "ethereumjs-vm@2.6.0" = f "ethereumjs-vm" "2.6.0" y "76243ed8de031b408793ac33907fb3407fe400c6" [
          (s."async@^2.1.2")
          (s."async-eventemitter@^0.2.2")
          (s."ethereumjs-account@^2.0.3")
          (s."ethereumjs-block@~2.2.0")
          (s."ethereumjs-common@^1.1.0")
          (s."ethereumjs-util@^6.0.0")
          (s."fake-merkle-patricia-tree@^1.0.1")
          (s."functional-red-black-tree@^1.0.1")
          (s."merkle-patricia-tree@^2.3.2")
          (s."rustbn.js@~0.2.0")
          (s."safe-buffer@^5.1.1")
          ];
        "ethereumjs-vm@4.2.0" = f "ethereumjs-vm" "4.2.0" y "e885e861424e373dbc556278f7259ff3fca5edab" [
          (s."async@^2.1.2")
          (s."async-eventemitter@^0.2.2")
          (s."core-js-pure@^3.0.1")
          (s."ethereumjs-account@^3.0.0")
          (s."ethereumjs-block@^2.2.2")
          (s."ethereumjs-blockchain@^4.0.3")
          (s."ethereumjs-common@^1.5.0")
          (s."ethereumjs-tx@^2.1.2")
          (s."ethereumjs-util@^6.2.0")
          (s."fake-merkle-patricia-tree@^1.0.1")
          (s."functional-red-black-tree@^1.0.1")
          (s."merkle-patricia-tree@^2.3.2")
          (s."rustbn.js@~0.2.0")
          (s."safe-buffer@^5.1.1")
          (s."util.promisify@^1.0.0")
          ];
        "ethereumjs-vm@^2.1.0" = s."ethereumjs-vm@2.6.0";
        "ethereumjs-vm@^2.3.4" = s."ethereumjs-vm@2.6.0";
        "ethereumjs-vm@^2.6.0" = s."ethereumjs-vm@2.6.0";
        "ethereumjs-wallet@0.6.5" = f "ethereumjs-wallet" "0.6.5" y "685e9091645cee230ad125c007658833991ed474" [
          (s."aes-js@^3.1.1")
          (s."bs58check@^2.1.2")
          (s."ethereum-cryptography@^0.1.3")
          (s."ethereumjs-util@^6.0.0")
          (s."randombytes@^2.0.6")
          (s."safe-buffer@^5.1.2")
          (s."scryptsy@^1.2.1")
          (s."utf8@^3.0.0")
          (s."uuid@^3.3.2")
          ];
        "ethjs-unit@0.1.6" = f "ethjs-unit" "0.1.6" y "c665921e476e87bce2a9d588a6fe0405b2c41699" [
          (s."bn.js@4.11.6")
          (s."number-to-bn@1.7.0")
          ];
        "ethjs-util@0.1.6" = f "ethjs-util" "0.1.6" y "f308b62f185f9fe6237132fb2a9818866a5cd536" [
          (s."is-hex-prefixed@1.0.0")
          (s."strip-hex-prefix@1.0.0")
          ];
        "ethjs-util@^0.1.3" = s."ethjs-util@0.1.6";
        "eventemitter3@4.0.4" = f "eventemitter3" "4.0.4" y "b5463ace635a083d018bdc7c917b4c5f10a85384" [];
        "events@3.2.0" = f "events" "3.2.0" y "93b87c18f8efcd4202a461aec4dfc0556b639379" [];
        "events@^3.0.0" = s."events@3.2.0";
        "evp_bytestokey@1.0.3" = f "evp_bytestokey" "1.0.3" y "7fcbdb198dc71959432efe13842684e0525acb02" [
          (s."md5.js@^1.3.4")
          (s."safe-buffer@^5.1.1")
          ];
        "evp_bytestokey@^1.0.0" = s."evp_bytestokey@1.0.3";
        "evp_bytestokey@^1.0.3" = s."evp_bytestokey@1.0.3";
        "execa@0.7.0" = f "execa" "0.7.0" y "944becd34cc41ee32a63a9faf27ad5a65fc59777" [
          (s."cross-spawn@^5.0.1")
          (s."get-stream@^3.0.0")
          (s."is-stream@^1.1.0")
          (s."npm-run-path@^2.0.0")
          (s."p-finally@^1.0.0")
          (s."signal-exit@^3.0.0")
          (s."strip-eof@^1.0.0")
          ];
        "execa@1.0.0" = f "execa" "1.0.0" y "c6236a5bb4df6d6f15e88e7f017798216749ddd8" [
          (s."cross-spawn@^6.0.0")
          (s."get-stream@^4.0.0")
          (s."is-stream@^1.1.0")
          (s."npm-run-path@^2.0.0")
          (s."p-finally@^1.0.0")
          (s."signal-exit@^3.0.0")
          (s."strip-eof@^1.0.0")
          ];
        "execa@4.0.3" = f "execa" "4.0.3" y "0a34dabbad6d66100bd6f2c576c8669403f317f2" [
          (s."cross-spawn@^7.0.0")
          (s."get-stream@^5.0.0")
          (s."human-signals@^1.1.1")
          (s."is-stream@^2.0.0")
          (s."merge-stream@^2.0.0")
          (s."npm-run-path@^4.0.0")
          (s."onetime@^5.1.0")
          (s."signal-exit@^3.0.2")
          (s."strip-final-newline@^2.0.0")
          ];
        "execa@^0.7.0" = s."execa@0.7.0";
        "execa@^1.0.0" = s."execa@1.0.0";
        "execa@^4.0.0" = s."execa@4.0.3";
        "expand-brackets@2.1.4" = f "expand-brackets" "2.1.4" y "b77735e315ce30f6b6eff0f83b04151a22449622" [
          (s."debug@^2.3.3")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."posix-character-classes@^0.1.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "expand-brackets@^2.1.4" = s."expand-brackets@2.1.4";
        "expand-tilde@2.0.2" = f "expand-tilde" "2.0.2" y "97e801aa052df02454de46b02bf621642cdc8502" [
          (s."homedir-polyfill@^1.0.1")
          ];
        "expand-tilde@^2.0.0" = s."expand-tilde@2.0.2";
        "expand-tilde@^2.0.2" = s."expand-tilde@2.0.2";
        "express@4.17.1" = f "express" "4.17.1" y "4491fc38605cf51f8629d39c2b5d026f98a4c134" [
          (s."accepts@~1.3.7")
          (s."array-flatten@1.1.1")
          (s."body-parser@1.19.0")
          (s."content-disposition@0.5.3")
          (s."content-type@~1.0.4")
          (s."cookie@0.4.0")
          (s."cookie-signature@1.0.6")
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."finalhandler@~1.1.2")
          (s."fresh@0.5.2")
          (s."merge-descriptors@1.0.1")
          (s."methods@~1.1.2")
          (s."on-finished@~2.3.0")
          (s."parseurl@~1.3.3")
          (s."path-to-regexp@0.1.7")
          (s."proxy-addr@~2.0.5")
          (s."qs@6.7.0")
          (s."range-parser@~1.2.1")
          (s."safe-buffer@5.1.2")
          (s."send@0.17.1")
          (s."serve-static@1.14.1")
          (s."setprototypeof@1.1.1")
          (s."statuses@~1.5.0")
          (s."type-is@~1.6.18")
          (s."utils-merge@1.0.1")
          (s."vary@~1.1.2")
          ];
        "express@^4.14.0" = s."express@4.17.1";
        "ext@1.4.0" = f "ext" "1.4.0" y "89ae7a07158f79d35517882904324077e4379244" [
          (s."type@^2.0.0")
          ];
        "ext@^1.1.2" = s."ext@1.4.0";
        "extend-shallow@2.0.1" = f "extend-shallow" "2.0.1" y "51af7d614ad9a9f610ea1bafbb989d6b1c56890f" [
          (s."is-extendable@^0.1.0")
          ];
        "extend-shallow@3.0.2" = f "extend-shallow" "3.0.2" y "26a71aaf073b39fb2127172746131c2704028db8" [
          (s."assign-symbols@^1.0.0")
          (s."is-extendable@^1.0.1")
          ];
        "extend-shallow@^2.0.1" = s."extend-shallow@2.0.1";
        "extend-shallow@^3.0.0" = s."extend-shallow@3.0.2";
        "extend-shallow@^3.0.2" = s."extend-shallow@3.0.2";
        "extend@3.0.2" = f "extend" "3.0.2" y "f8b1136b4071fbd8eb140aff858b1019ec2915fa" [];
        "extend@~3.0.2" = s."extend@3.0.2";
        "extglob@2.0.4" = f "extglob" "2.0.4" y "ad00fe4dc612a9232e8718711dc5cb5ab0285543" [
          (s."array-unique@^0.3.2")
          (s."define-property@^1.0.0")
          (s."expand-brackets@^2.1.4")
          (s."extend-shallow@^2.0.1")
          (s."fragment-cache@^0.2.1")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "extglob@^2.0.4" = s."extglob@2.0.4";
        "extsprintf@1.3.0" = f "extsprintf" "1.3.0" y "96918440e3041a7a414f8c52e3c574eb3c3e1e05" [];
        "extsprintf@^1.2.0" = s."extsprintf@1.3.0";
        "fake-merkle-patricia-tree@1.0.1" = f "fake-merkle-patricia-tree" "1.0.1" y "4b8c3acfb520afadf9860b1f14cd8ce3402cddd3" [
          (s."checkpoint-store@^1.1.0")
          ];
        "fake-merkle-patricia-tree@^1.0.1" = s."fake-merkle-patricia-tree@1.0.1";
        "fast-deep-equal@1.1.0" = f "fast-deep-equal" "1.1.0" y "c053477817c86b51daa853c81e059b733d023614" [];
        "fast-deep-equal@3.1.3" = f "fast-deep-equal" "3.1.3" y "3a7d56b559d6cbc3eb512325244e619a65c6c525" [];
        "fast-deep-equal@^1.0.0" = s."fast-deep-equal@1.1.0";
        "fast-deep-equal@^3.1.1" = s."fast-deep-equal@3.1.3";
        "fast-glob@3.2.4" = f "fast-glob" "3.2.4" y "d20aefbf99579383e7f3cc66529158c9b98554d3" [
          (s."@nodelib/fs.stat@^2.0.2")
          (s."@nodelib/fs.walk@^1.2.3")
          (s."glob-parent@^5.1.0")
          (s."merge2@^1.3.0")
          (s."micromatch@^4.0.2")
          (s."picomatch@^2.2.1")
          ];
        "fast-glob@^3.1.1" = s."fast-glob@3.2.4";
        "fast-json-stable-stringify@2.0.0" = f "fast-json-stable-stringify" "2.0.0" y "d5142c0caee6b1189f87d3a76111064f86c8bbf2" [];
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.0.0";
        "fastq@1.8.0" = f "fastq" "1.8.0" y "550e1f9f59bbc65fe185cb6a9b4d95357107f481" [
          (s."reusify@^1.0.4")
          ];
        "fastq@^1.6.0" = s."fastq@1.8.0";
        "fetch-ponyfill@4.1.0" = f "fetch-ponyfill" "4.1.0" y "ae3ce5f732c645eab87e4ae8793414709b239893" [
          (s."node-fetch@~1.7.1")
          ];
        "fetch-ponyfill@^4.0.0" = s."fetch-ponyfill@4.1.0";
        "figgy-pudding@3.5.1" = f "figgy-pudding" "3.5.1" y "862470112901c727a0e495a80744bd5baa1d6790" [];
        "figgy-pudding@^3.4.1" = s."figgy-pudding@3.5.1";
        "figgy-pudding@^3.5.1" = s."figgy-pudding@3.5.1";
        "figures@2.0.0" = f "figures" "2.0.0" y "3ab1a2d2a62c8bfb431a0c94cb797a2fce27c962" [
          (s."escape-string-regexp@^1.0.5")
          ];
        "figures@3.2.0" = f "figures" "3.2.0" y "625c18bd293c604dc4a8ddb2febf0c88341746af" [
          (s."escape-string-regexp@^1.0.5")
          ];
        "figures@^2.0.0" = s."figures@2.0.0";
        "figures@^3.0.0" = s."figures@3.2.0";
        "file-uri-to-path@1.0.0" = f "file-uri-to-path" "1.0.0" y "553a7b8446ff6f684359c445f1e37a05dacc33dd" [];
        "fill-range@4.0.0" = f "fill-range" "4.0.0" y "d544811d428f98eb06a63dc402d2403c328c38f7" [
          (s."extend-shallow@^2.0.1")
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          (s."to-regex-range@^2.1.0")
          ];
        "fill-range@7.0.1" = f "fill-range" "7.0.1" y "1919a6a7c75fe38b2c7c77e5198535da9acdda40" [
          (s."to-regex-range@^5.0.1")
          ];
        "fill-range@^4.0.0" = s."fill-range@4.0.0";
        "fill-range@^7.0.1" = s."fill-range@7.0.1";
        "finalhandler@1.1.2" = f "finalhandler" "1.1.2" y "b7e7d000ffd11938d0fdb053506f6ebabe9f587d" [
          (s."debug@2.6.9")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."on-finished@~2.3.0")
          (s."parseurl@~1.3.3")
          (s."statuses@~1.5.0")
          (s."unpipe@~1.0.0")
          ];
        "finalhandler@~1.1.2" = s."finalhandler@1.1.2";
        "find-cache-dir@2.1.0" = f "find-cache-dir" "2.1.0" y "8d0f94cd13fe43c6c7c261a0d86115ca918c05f7" [
          (s."commondir@^1.0.1")
          (s."make-dir@^2.0.0")
          (s."pkg-dir@^3.0.0")
          ];
        "find-cache-dir@^2.1.0" = s."find-cache-dir@2.1.0";
        "find-npm-prefix@1.0.2" = f "find-npm-prefix" "1.0.2" y "8d8ce2c78b3b4b9e66c8acc6a37c231eb841cfdf" [];
        "find-npm-prefix@^1.0.2" = s."find-npm-prefix@1.0.2";
        "find-up@2.1.0" = f "find-up" "2.1.0" y "45d1b7e506c717ddd482775a2b77920a3c0c57a7" [
          (s."locate-path@^2.0.0")
          ];
        "find-up@3.0.0" = f "find-up" "3.0.0" y "49169f1d7993430646da61ecc5ae355c21c97b73" [
          (s."locate-path@^3.0.0")
          ];
        "find-up@4.1.0" = f "find-up" "4.1.0" y "97afe7d6cdc0bc5928584b7c8d7b16e8a9aa5d19" [
          (s."locate-path@^5.0.0")
          (s."path-exists@^4.0.0")
          ];
        "find-up@^2.0.0" = s."find-up@2.1.0";
        "find-up@^3.0.0" = s."find-up@3.0.0";
        "find-up@^4.1.0" = s."find-up@4.1.0";
        "find-versions@3.2.0" = f "find-versions" "3.2.0" y "10297f98030a786829681690545ef659ed1d254e" [
          (s."semver-regex@^2.0.0")
          ];
        "find-versions@^3.0.0" = s."find-versions@3.2.0";
        "find-yarn-workspace-root@1.2.1" = f "find-yarn-workspace-root" "1.2.1" y "40eb8e6e7c2502ddfaa2577c176f221422f860db" [
          (s."fs-extra@^4.0.3")
          (s."micromatch@^3.1.4")
          ];
        "find-yarn-workspace-root@^1.2.1" = s."find-yarn-workspace-root@1.2.1";
        "findup-sync@3.0.0" = f "findup-sync" "3.0.0" y "17b108f9ee512dfb7a5c7f3c8b27ea9e1a9c08d1" [
          (s."detect-file@^1.0.0")
          (s."is-glob@^4.0.0")
          (s."micromatch@^3.0.4")
          (s."resolve-dir@^1.0.1")
          ];
        "findup-sync@^3.0.0" = s."findup-sync@3.0.0";
        "flow-stoplight@1.0.0" = f "flow-stoplight" "1.0.0" y "4a292c5bcff8b39fa6cc0cb1a853d86f27eeff7b" [];
        "flow-stoplight@^1.0.0" = s."flow-stoplight@1.0.0";
        "flush-write-stream@1.0.3" = f "flush-write-stream" "1.0.3" y "c5d586ef38af6097650b49bc41b55fabb19f35bd" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.4")
          ];
        "flush-write-stream@^1.0.0" = s."flush-write-stream@1.0.3";
        "for-each@0.3.3" = f "for-each" "0.3.3" y "69b447e88a0a5d32c3e7084f3f1710034b21376e" [
          (s."is-callable@^1.1.3")
          ];
        "for-each@~0.3.3" = s."for-each@0.3.3";
        "for-in@1.0.2" = f "for-in" "1.0.2" y "81068d295a8142ec0ac726c6e2200c30fb6d5e80" [];
        "for-in@^1.0.2" = s."for-in@1.0.2";
        "forever-agent@0.6.1" = f "forever-agent" "0.6.1" y "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91" [];
        "forever-agent@~0.6.1" = s."forever-agent@0.6.1";
        "form-data@2.3.2" = f "form-data" "2.3.2" y "4970498be604c20c005d4f5c23aecd21d6b49099" [
          (s."asynckit@^0.4.0")
          (s."combined-stream@1.0.6")
          (s."mime-types@^2.1.12")
          ];
        "form-data@~2.3.2" = s."form-data@2.3.2";
        "forwarded@0.1.2" = f "forwarded" "0.1.2" y "98c23dab1175657b8c0573e8ceccd91b0ff18c84" [];
        "forwarded@~0.1.2" = s."forwarded@0.1.2";
        "fragment-cache@0.2.1" = f "fragment-cache" "0.2.1" y "4290fad27f13e89be7f33799c6bc5a0abfff0d19" [
          (s."map-cache@^0.2.2")
          ];
        "fragment-cache@^0.2.1" = s."fragment-cache@0.2.1";
        "fresh@0.5.2" = f "fresh" "0.5.2" y "3d8cadd90d976569fa835ab1f8e4b23a105605a7" [];
        "from2@1.3.0" = f "from2" "1.3.0" y "88413baaa5f9a597cfde9221d86986cd3c061dfd" [
          (s."inherits@~2.0.1")
          (s."readable-stream@~1.1.10")
          ];
        "from2@2.3.0" = f "from2" "2.3.0" y "8bfb5502bde4a4d36cfdeea007fcca21d7e382af" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.0")
          ];
        "from2@^1.3.0" = s."from2@1.3.0";
        "from2@^2.1.0" = s."from2@2.3.0";
        "from2@^2.3.0" = s."from2@2.3.0";
        "fs-extra@4.0.3" = f "fs-extra" "4.0.3" y "0d852122e5bc5beb453fb028e9c0c9bf36340c94" [
          (s."graceful-fs@^4.1.2")
          (s."jsonfile@^4.0.0")
          (s."universalify@^0.1.0")
          ];
        "fs-extra@7.0.1" = f "fs-extra" "7.0.1" y "4f189c44aa123b895f722804f55ea23eadc348e9" [
          (s."graceful-fs@^4.1.2")
          (s."jsonfile@^4.0.0")
          (s."universalify@^0.1.0")
          ];
        "fs-extra@9.0.1" = f "fs-extra" "9.0.1" y "910da0062437ba4c39fedd863f1675ccfefcb9fc" [
          (s."at-least-node@^1.0.0")
          (s."graceful-fs@^4.2.0")
          (s."jsonfile@^6.0.1")
          (s."universalify@^1.0.0")
          ];
        "fs-extra@^4.0.2" = s."fs-extra@4.0.3";
        "fs-extra@^4.0.3" = s."fs-extra@4.0.3";
        "fs-extra@^7.0.1" = s."fs-extra@7.0.1";
        "fs-extra@^9.0.0" = s."fs-extra@9.0.1";
        "fs-minipass@1.2.7" = f "fs-minipass" "1.2.7" y "ccff8570841e7fe4265693da88936c55aed7f7c7" [
          (s."minipass@^2.6.0")
          ];
        "fs-minipass@^1.2.5" = s."fs-minipass@1.2.7";
        "fs-vacuum@1.2.10" = f "fs-vacuum" "1.2.10" y "b7629bec07a4031a2548fdf99f5ecf1cc8b31e36" [
          (s."graceful-fs@^4.1.2")
          (s."path-is-inside@^1.0.1")
          (s."rimraf@^2.5.2")
          ];
        "fs-vacuum@^1.2.10" = s."fs-vacuum@1.2.10";
        "fs-vacuum@~1.2.10" = s."fs-vacuum@1.2.10";
        "fs-write-stream-atomic@1.0.10" = f "fs-write-stream-atomic" "1.0.10" y "b47df53493ef911df75731e70a9ded0189db40c9" [
          (s."graceful-fs@^4.1.2")
          (s."iferr@^0.1.5")
          (s."imurmurhash@^0.1.4")
          (s."readable-stream@1 || 2")
          ];
        "fs-write-stream-atomic@^1.0.8" = s."fs-write-stream-atomic@1.0.10";
        "fs-write-stream-atomic@~1.0.10" = s."fs-write-stream-atomic@1.0.10";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fsevents@1.2.13" = f "fsevents" "1.2.13" y "f325cb0455592428bcf11b383370ef70e3bfcc38" [
          (s."bindings@^1.5.0")
          (s."nan@^2.12.1")
          ];
        "fsevents@2.1.3" = f "fsevents" "2.1.3" y "fb738703ae8d2f9fe900c33836ddebee8b97f23e" [];
        "fsevents@^1.2.7" = s."fsevents@1.2.13";
        "fsevents@~2.1.2" = s."fsevents@2.1.3";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.1.1" = s."function-bind@1.1.1";
        "function-bind@~1.1.1" = s."function-bind@1.1.1";
        "functional-red-black-tree@1.0.1" = f "functional-red-black-tree" "1.0.1" y "1b0ab3bd553b2a0d6399d29c0e3ea0b252078327" [];
        "functional-red-black-tree@^1.0.1" = s."functional-red-black-tree@1.0.1";
        "functional-red-black-tree@~1.0.1" = s."functional-red-black-tree@1.0.1";
        "ganache-core@2.13.1" = f "ganache-core" "2.13.1" y "bf60399a2dd084e1090db91cbbc7ed3885dc01e4" [
          (s."abstract-leveldown@3.0.0")
          (s."async@2.6.2")
          (s."bip39@2.5.0")
          (s."cachedown@1.0.0")
          (s."clone@2.1.2")
          (s."debug@3.2.6")
          (s."encoding-down@5.0.4")
          (s."eth-sig-util@^2.0.0")
          (s."ethereumjs-abi@0.6.8")
          (s."ethereumjs-account@3.0.0")
          (s."ethereumjs-block@2.2.2")
          (s."ethereumjs-common@1.5.0")
          (s."ethereumjs-tx@2.1.2")
          (s."ethereumjs-util@6.2.1")
          (s."ethereumjs-vm@4.2.0")
          (s."heap@0.2.6")
          (s."keccak@3.0.1")
          (s."level-sublevel@6.6.4")
          (s."levelup@3.1.1")
          (s."lodash@4.17.20")
          (s."lru-cache@5.1.1")
          (s."merkle-patricia-tree@3.0.0")
          (s."patch-package@6.2.2")
          (s."seedrandom@3.0.1")
          (s."source-map-support@0.5.12")
          (s."tmp@0.1.0")
          (s."web3-provider-engine@14.2.1")
          (s."websocket@1.0.32")
          (s."ethereumjs-wallet@0.6.5")
          (s."web3@1.2.11")
          ];
        "gauge@2.7.4" = f "gauge" "2.7.4" y "2c03405c7538c39d7eb37b317022e325fb018bf7" [
          (s."aproba@^1.0.3")
          (s."console-control-strings@^1.0.0")
          (s."has-unicode@^2.0.0")
          (s."object-assign@^4.1.0")
          (s."signal-exit@^3.0.0")
          (s."string-width@^1.0.1")
          (s."strip-ansi@^3.0.1")
          (s."wide-align@^1.1.0")
          ];
        "gauge@~2.7.3" = s."gauge@2.7.4";
        "genfun@5.0.0" = f "genfun" "5.0.0" y "9dd9710a06900a5c4a5bf57aca5da4e52fe76537" [];
        "genfun@^5.0.0" = s."genfun@5.0.0";
        "gentle-fs@2.3.1" = f "gentle-fs" "2.3.1" y "11201bf66c18f930ddca72cf69460bdfa05727b1" [
          (s."aproba@^1.1.2")
          (s."chownr@^1.1.2")
          (s."cmd-shim@^3.0.3")
          (s."fs-vacuum@^1.2.10")
          (s."graceful-fs@^4.1.11")
          (s."iferr@^0.1.5")
          (s."infer-owner@^1.0.4")
          (s."mkdirp@^0.5.1")
          (s."path-is-inside@^1.0.2")
          (s."read-cmd-shim@^1.0.1")
          (s."slide@^1.1.6")
          ];
        "gentle-fs@^2.3.0" = s."gentle-fs@2.3.1";
        "gentle-fs@^2.3.1" = s."gentle-fs@2.3.1";
        "get-caller-file@2.0.5" = f "get-caller-file" "2.0.5" y "4f94412a82db32f36e3b0b9741f8a97feb031f7e" [];
        "get-caller-file@^2.0.1" = s."get-caller-file@2.0.5";
        "get-stream@3.0.0" = f "get-stream" "3.0.0" y "8e943d1358dc37555054ecbe2edb05aa174ede14" [];
        "get-stream@4.1.0" = f "get-stream" "4.1.0" y "c1b255575f3dc21d59bfc79cd3d2b46b1c3a54b5" [
          (s."pump@^3.0.0")
          ];
        "get-stream@5.2.0" = f "get-stream" "5.2.0" y "4966a1795ee5ace65e706c4b7beb71257d6e22d3" [
          (s."pump@^3.0.0")
          ];
        "get-stream@^3.0.0" = s."get-stream@3.0.0";
        "get-stream@^4.0.0" = s."get-stream@4.1.0";
        "get-stream@^4.1.0" = s."get-stream@4.1.0";
        "get-stream@^5.0.0" = s."get-stream@5.2.0";
        "get-stream@^5.1.0" = s."get-stream@5.2.0";
        "get-value@2.0.6" = f "get-value" "2.0.6" y "dc15ca1c672387ca76bd37ac0a395ba2042a2c28" [];
        "get-value@^2.0.3" = s."get-value@2.0.6";
        "get-value@^2.0.6" = s."get-value@2.0.6";
        "getpass@0.1.7" = f "getpass" "0.1.7" y "5eff8e3e684d569ae4cb2b1282604e8ba62149fa" [
          (s."assert-plus@^1.0.0")
          ];
        "getpass@^0.1.1" = s."getpass@0.1.7";
        "git-log-parser@1.2.0" = f "git-log-parser" "1.2.0" y "2e6a4c1b13fc00028207ba795a7ac31667b9fd4a" [
          (s."argv-formatter@~1.0.0")
          (s."spawn-error-forwarder@~1.0.0")
          (s."split2@~1.0.0")
          (s."stream-combiner2@~1.1.1")
          (s."through2@~2.0.0")
          (s."traverse@~0.6.6")
          ];
        "git-log-parser@^1.2.0" = s."git-log-parser@1.2.0";
        "glob-parent@3.1.0" = f "glob-parent" "3.1.0" y "9e6af6299d8d3bd2bd40430832bd113df906c5ae" [
          (s."is-glob@^3.1.0")
          (s."path-dirname@^1.0.0")
          ];
        "glob-parent@5.1.1" = f "glob-parent" "5.1.1" y "b6c1ef417c4e5663ea498f1c45afac6916bbc229" [
          (s."is-glob@^4.0.1")
          ];
        "glob-parent@^3.1.0" = s."glob-parent@3.1.0";
        "glob-parent@^5.1.0" = s."glob-parent@5.1.1";
        "glob-parent@~5.1.0" = s."glob-parent@5.1.1";
        "glob@7.1.6" = f "glob" "7.1.6" y "141f33b81a7c2492e125594307480c46679278a6" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.0.4")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@^7.1.1" = s."glob@7.1.6";
        "glob@^7.1.3" = s."glob@7.1.6";
        "glob@^7.1.4" = s."glob@7.1.6";
        "glob@^7.1.6" = s."glob@7.1.6";
        "glob@~7.1.6" = s."glob@7.1.6";
        "global-dirs@0.1.1" = f "global-dirs" "0.1.1" y "b319c0dd4607f353f3be9cca4c72fc148c49f445" [
          (s."ini@^1.3.4")
          ];
        "global-dirs@^0.1.0" = s."global-dirs@0.1.1";
        "global-modules@1.0.0" = f "global-modules" "1.0.0" y "6d770f0eb523ac78164d72b5e71a8877265cc3ea" [
          (s."global-prefix@^1.0.1")
          (s."is-windows@^1.0.1")
          (s."resolve-dir@^1.0.0")
          ];
        "global-modules@2.0.0" = f "global-modules" "2.0.0" y "997605ad2345f27f51539bea26574421215c7780" [
          (s."global-prefix@^3.0.0")
          ];
        "global-modules@^1.0.0" = s."global-modules@1.0.0";
        "global-modules@^2.0.0" = s."global-modules@2.0.0";
        "global-prefix@1.0.2" = f "global-prefix" "1.0.2" y "dbf743c6c14992593c655568cb66ed32c0122ebe" [
          (s."expand-tilde@^2.0.2")
          (s."homedir-polyfill@^1.0.1")
          (s."ini@^1.3.4")
          (s."is-windows@^1.0.1")
          (s."which@^1.2.14")
          ];
        "global-prefix@3.0.0" = f "global-prefix" "3.0.0" y "fc85f73064df69f50421f47f883fe5b913ba9b97" [
          (s."ini@^1.3.5")
          (s."kind-of@^6.0.2")
          (s."which@^1.3.1")
          ];
        "global-prefix@^1.0.1" = s."global-prefix@1.0.2";
        "global-prefix@^3.0.0" = s."global-prefix@3.0.0";
        "global@4.3.2" = f "global" "4.3.2" y "e76989268a6c74c38908b1305b10fc0e394e9d0f" [
          (s."min-document@^2.19.0")
          (s."process@~0.5.1")
          ];
        "global@~4.3.0" = s."global@4.3.2";
        "globals@9.18.0" = f "globals" "9.18.0" y "aa3896b3e69b487f17e31ed2143d69a8e30c2d8a" [];
        "globals@^9.18.0" = s."globals@9.18.0";
        "globby@11.0.1" = f "globby" "11.0.1" y "9a2bf107a068f3ffeabc49ad702c79ede8cfd357" [
          (s."array-union@^2.1.0")
          (s."dir-glob@^3.0.1")
          (s."fast-glob@^3.1.1")
          (s."ignore@^5.1.4")
          (s."merge2@^1.3.0")
          (s."slash@^3.0.0")
          ];
        "globby@^11.0.0" = s."globby@11.0.1";
        "got@6.7.1" = f "got" "6.7.1" y "240cd05785a9a18e561dc1b44b41c763ef1e8db0" [
          (s."create-error-class@^3.0.0")
          (s."duplexer3@^0.1.4")
          (s."get-stream@^3.0.0")
          (s."is-redirect@^1.0.0")
          (s."is-retry-allowed@^1.0.0")
          (s."is-stream@^1.0.0")
          (s."lowercase-keys@^1.0.0")
          (s."safe-buffer@^5.0.1")
          (s."timed-out@^4.0.0")
          (s."unzip-response@^2.0.1")
          (s."url-parse-lax@^1.0.0")
          ];
        "got@7.1.0" = f "got" "7.1.0" y "05450fd84094e6bbea56f451a43a9c289166385a" [
          (s."decompress-response@^3.2.0")
          (s."duplexer3@^0.1.4")
          (s."get-stream@^3.0.0")
          (s."is-plain-obj@^1.1.0")
          (s."is-retry-allowed@^1.0.0")
          (s."is-stream@^1.0.0")
          (s."isurl@^1.0.0-alpha5")
          (s."lowercase-keys@^1.0.0")
          (s."p-cancelable@^0.3.0")
          (s."p-timeout@^1.1.1")
          (s."safe-buffer@^5.0.1")
          (s."timed-out@^4.0.0")
          (s."url-parse-lax@^1.0.0")
          (s."url-to-options@^1.0.1")
          ];
        "got@9.6.0" = f "got" "9.6.0" y "edf45e7d67f99545705de1f7bbeeeb121765ed85" [
          (s."@sindresorhus/is@^0.14.0")
          (s."@szmarczak/http-timer@^1.1.2")
          (s."cacheable-request@^6.0.0")
          (s."decompress-response@^3.3.0")
          (s."duplexer3@^0.1.4")
          (s."get-stream@^4.1.0")
          (s."lowercase-keys@^1.0.1")
          (s."mimic-response@^1.0.1")
          (s."p-cancelable@^1.0.0")
          (s."to-readable-stream@^1.0.0")
          (s."url-parse-lax@^3.0.0")
          ];
        "got@^6.7.1" = s."got@6.7.1";
        "got@^7.1.0" = s."got@7.1.0";
        "graceful-fs@4.2.4" = f "graceful-fs" "4.2.4" y "2256bde14d3632958c465ebc96dc467ca07a29fb" [];
        "graceful-fs@^4.1.11" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.15" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.2" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.1.6" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.2.0" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.2.2" = s."graceful-fs@4.2.4";
        "graceful-fs@^4.2.4" = s."graceful-fs@4.2.4";
        "handlebars@4.7.6" = f "handlebars" "4.7.6" y "d4c05c1baf90e9945f77aa68a7a219aa4a7df74e" [
          (s."minimist@^1.2.5")
          (s."neo-async@^2.6.0")
          (s."source-map@^0.6.1")
          (s."wordwrap@^1.0.0")
          (s."uglify-js@^3.1.4")
          ];
        "handlebars@^4.7.6" = s."handlebars@4.7.6";
        "har-schema@2.0.0" = f "har-schema" "2.0.0" y "a94c2224ebcac04782a0d9035521f24735b7ec92" [];
        "har-schema@^2.0.0" = s."har-schema@2.0.0";
        "har-validator@5.1.0" = f "har-validator" "5.1.0" y "44657f5688a22cfd4b72486e81b3a3fb11742c29" [
          (s."ajv@^5.3.0")
          (s."har-schema@^2.0.0")
          ];
        "har-validator@5.1.5" = f "har-validator" "5.1.5" y "1f0803b9f8cb20c0fa13822df1ecddb36bde1efd" [
          (s."ajv@^6.12.3")
          (s."har-schema@^2.0.0")
          ];
        "har-validator@~5.1.0" = s."har-validator@5.1.0";
        "har-validator@~5.1.3" = s."har-validator@5.1.5";
        "hard-rejection@2.1.0" = f "hard-rejection" "2.1.0" y "1c6eda5c1685c63942766d79bb40ae773cecd883" [];
        "hard-rejection@^2.1.0" = s."hard-rejection@2.1.0";
        "has-ansi@2.0.0" = f "has-ansi" "2.0.0" y "34f5049ce1ecdf2b0649af3ef24e45ed35416d91" [
          (s."ansi-regex@^2.0.0")
          ];
        "has-ansi@^2.0.0" = s."has-ansi@2.0.0";
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@4.0.0" = f "has-flag" "4.0.0" y "944771fd9c81c81265c4d6941860da06bb59479b" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-flag@^4.0.0" = s."has-flag@4.0.0";
        "has-symbol-support-x@1.4.2" = f "has-symbol-support-x" "1.4.2" y "1409f98bc00247da45da67cee0a36f282ff26455" [];
        "has-symbol-support-x@^1.4.1" = s."has-symbol-support-x@1.4.2";
        "has-symbols@1.0.0" = f "has-symbols" "1.0.0" y "ba1a8f1af2a0fc39650f5c850367704122063b44" [];
        "has-symbols@1.0.1" = f "has-symbols" "1.0.1" y "9f5214758a44196c406d9bd76cebf81ec2dd31e8" [];
        "has-symbols@^1.0.0" = s."has-symbols@1.0.0";
        "has-symbols@^1.0.1" = s."has-symbols@1.0.1";
        "has-to-string-tag-x@1.4.1" = f "has-to-string-tag-x" "1.4.1" y "a045ab383d7b4b2012a00148ab0aa5f290044d4d" [
          (s."has-symbol-support-x@^1.4.1")
          ];
        "has-to-string-tag-x@^1.2.0" = s."has-to-string-tag-x@1.4.1";
        "has-unicode@2.0.1" = f "has-unicode" "2.0.1" y "e0e6fe6a28cf51138855e086d1691e771de2a8b9" [];
        "has-unicode@^2.0.0" = s."has-unicode@2.0.1";
        "has-unicode@~2.0.1" = s."has-unicode@2.0.1";
        "has-value@0.3.1" = f "has-value" "0.3.1" y "7b1f58bada62ca827ec0a2078025654845995e1f" [
          (s."get-value@^2.0.3")
          (s."has-values@^0.1.4")
          (s."isobject@^2.0.0")
          ];
        "has-value@1.0.0" = f "has-value" "1.0.0" y "18b281da585b1c5c51def24c930ed29a0be6b177" [
          (s."get-value@^2.0.6")
          (s."has-values@^1.0.0")
          (s."isobject@^3.0.0")
          ];
        "has-value@^0.3.1" = s."has-value@0.3.1";
        "has-value@^1.0.0" = s."has-value@1.0.0";
        "has-values@0.1.4" = f "has-values" "0.1.4" y "6d61de95d91dfca9b9a02089ad384bff8f62b771" [];
        "has-values@1.0.0" = f "has-values" "1.0.0" y "95b0b63fec2146619a6fe57fe75628d5a39efe4f" [
          (s."is-number@^3.0.0")
          (s."kind-of@^4.0.0")
          ];
        "has-values@^0.1.4" = s."has-values@0.1.4";
        "has-values@^1.0.0" = s."has-values@1.0.0";
        "has@1.0.3" = f "has" "1.0.3" y "722d7cbfc1f6aa8241f16dd814e011e1f41e8796" [
          (s."function-bind@^1.1.1")
          ];
        "has@^1.0.1" = s."has@1.0.3";
        "has@^1.0.3" = s."has@1.0.3";
        "has@~1.0.3" = s."has@1.0.3";
        "hash-base@3.1.0" = f "hash-base" "3.1.0" y "55c381d9e06e1d2997a883b4a3fddfe7f0d3af33" [
          (s."inherits@^2.0.4")
          (s."readable-stream@^3.6.0")
          (s."safe-buffer@^5.2.0")
          ];
        "hash-base@^3.0.0" = s."hash-base@3.1.0";
        "hash.js@1.1.7" = f "hash.js" "1.1.7" y "0babca538e8d4ee4a0f8988d68866537a003cf42" [
          (s."inherits@^2.0.3")
          (s."minimalistic-assert@^1.0.1")
          ];
        "hash.js@^1.0.0" = s."hash.js@1.1.7";
        "hash.js@^1.0.3" = s."hash.js@1.1.7";
        "hash.js@^1.1.7" = s."hash.js@1.1.7";
        "heap@0.2.6" = f "heap" "0.2.6" y "087e1f10b046932fc8594dd9e6d378afc9d1e5ac" [];
        "hmac-drbg@1.0.1" = f "hmac-drbg" "1.0.1" y "d2745701025a6c775a6c545793ed502fc0c649a1" [
          (s."hash.js@^1.0.3")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.1")
          ];
        "hmac-drbg@^1.0.0" = s."hmac-drbg@1.0.1";
        "home-or-tmp@2.0.0" = f "home-or-tmp" "2.0.0" y "e36c3f2d2cae7d746a857e38d18d5f32a7882db8" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.1")
          ];
        "home-or-tmp@^2.0.0" = s."home-or-tmp@2.0.0";
        "homedir-polyfill@1.0.3" = f "homedir-polyfill" "1.0.3" y "743298cef4e5af3e194161fbadcc2151d3a058e8" [
          (s."parse-passwd@^1.0.0")
          ];
        "homedir-polyfill@^1.0.1" = s."homedir-polyfill@1.0.3";
        "hook-std@2.0.0" = f "hook-std" "2.0.0" y "ff9aafdebb6a989a354f729bb6445cf4a3a7077c" [];
        "hook-std@^2.0.0" = s."hook-std@2.0.0";
        "hosted-git-info@2.8.8" = f "hosted-git-info" "2.8.8" y "7539bd4bc1e0e0a895815a2e0262420b12858488" [];
        "hosted-git-info@3.0.5" = f "hosted-git-info" "3.0.5" y "bea87905ef7317442e8df3087faa3c842397df03" [
          (s."lru-cache@^6.0.0")
          ];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.8.8";
        "hosted-git-info@^2.7.1" = s."hosted-git-info@2.8.8";
        "hosted-git-info@^2.8.8" = s."hosted-git-info@2.8.8";
        "hosted-git-info@^3.0.0" = s."hosted-git-info@3.0.5";
        "http-cache-semantics@3.8.1" = f "http-cache-semantics" "3.8.1" y "39b0e16add9b605bf0a9ef3d9daaf4843b4cacd2" [];
        "http-cache-semantics@4.1.0" = f "http-cache-semantics" "4.1.0" y "49e91c5cbf36c9b94bcfcd71c23d5249ec74e390" [];
        "http-cache-semantics@^3.8.1" = s."http-cache-semantics@3.8.1";
        "http-cache-semantics@^4.0.0" = s."http-cache-semantics@4.1.0";
        "http-errors@1.7.2" = f "http-errors" "1.7.2" y "4f5029cf13239f31036e5b2e55292bcfbcc85c8f" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.3")
          (s."setprototypeof@1.1.1")
          (s."statuses@>= 1.5.0 < 2")
          (s."toidentifier@1.0.0")
          ];
        "http-errors@~1.7.2" = s."http-errors@1.7.2";
        "http-https@1.0.0" = f "http-https" "1.0.0" y "2f908dd5f1db4068c058cd6e6d4ce392c913389b" [];
        "http-https@^1.0.0" = s."http-https@1.0.0";
        "http-proxy-agent@2.1.0" = f "http-proxy-agent" "2.1.0" y "e4821beef5b2142a2026bd73926fe537631c5405" [
          (s."agent-base@4")
          (s."debug@3.1.0")
          ];
        "http-proxy-agent@4.0.1" = f "http-proxy-agent" "4.0.1" y "8a8c8ef7f5932ccf953c296ca8291b95aa74aa3a" [
          (s."@tootallnate/once@1")
          (s."agent-base@6")
          (s."debug@4")
          ];
        "http-proxy-agent@^2.1.0" = s."http-proxy-agent@2.1.0";
        "http-proxy-agent@^4.0.0" = s."http-proxy-agent@4.0.1";
        "http-signature@1.2.0" = f "http-signature" "1.2.0" y "9aecd925114772f3d95b65a60abb8f7c18fbace1" [
          (s."assert-plus@^1.0.0")
          (s."jsprim@^1.2.2")
          (s."sshpk@^1.7.0")
          ];
        "http-signature@~1.2.0" = s."http-signature@1.2.0";
        "https-browserify@1.0.0" = f "https-browserify" "1.0.0" y "ec06c10e0a34c0f2faf199f7fd7fc78fffd03c73" [];
        "https-browserify@^1.0.0" = s."https-browserify@1.0.0";
        "https-proxy-agent@2.2.4" = f "https-proxy-agent" "2.2.4" y "4ee7a737abd92678a293d9b34a1af4d0d08c787b" [
          (s."agent-base@^4.3.0")
          (s."debug@^3.1.0")
          ];
        "https-proxy-agent@5.0.0" = f "https-proxy-agent" "5.0.0" y "e2a90542abb68a762e0a0850f6c9edadfd8506b2" [
          (s."agent-base@6")
          (s."debug@4")
          ];
        "https-proxy-agent@^2.2.3" = s."https-proxy-agent@2.2.4";
        "https-proxy-agent@^5.0.0" = s."https-proxy-agent@5.0.0";
        "human-signals@1.1.1" = f "human-signals" "1.1.1" y "c5b1cd14f50aeae09ab6c59fe63ba3395fe4dfa3" [];
        "human-signals@^1.1.1" = s."human-signals@1.1.1";
        "humanize-ms@1.2.1" = f "humanize-ms" "1.2.1" y "c46e3159a293f6b896da29316d8b6fe8bb79bbed" [
          (s."ms@^2.0.0")
          ];
        "humanize-ms@^1.2.1" = s."humanize-ms@1.2.1";
        "iconv-lite@0.4.23" = f "iconv-lite" "0.4.23" y "297871f63be507adcfbfca715d0cd0eed84e9a63" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "iconv-lite@0.6.2" = f "iconv-lite" "0.6.2" y "ce13d1875b0c3a674bd6a04b7f76b01b1b6ded01" [
          (s."safer-buffer@>= 2.1.2 < 3.0.0")
          ];
        "iconv-lite@^0.6.2" = s."iconv-lite@0.6.2";
        "iconv-lite@~0.4.13" = s."iconv-lite@0.4.23";
        "idna-uts46-hx@2.3.1" = f "idna-uts46-hx" "2.3.1" y "a1dc5c4df37eee522bf66d969cc980e00e8711f9" [
          (s."punycode@2.1.0")
          ];
        "idna-uts46-hx@^2.3.1" = s."idna-uts46-hx@2.3.1";
        "ieee754@1.1.13" = f "ieee754" "1.1.13" y "ec168558e95aa181fd87d37f55c32bbcb6708b84" [];
        "ieee754@^1.1.4" = s."ieee754@1.1.13";
        "iferr@0.1.5" = f "iferr" "0.1.5" y "c60eed69e6d8fdb6b3104a1fcbca1c192dc5b501" [];
        "iferr@1.0.2" = f "iferr" "1.0.2" y "e9fde49a9da06dc4a4194c6c9ed6d08305037a6d" [];
        "iferr@^0.1.5" = s."iferr@0.1.5";
        "iferr@^1.0.2" = s."iferr@1.0.2";
        "ignore-walk@3.0.3" = f "ignore-walk" "3.0.3" y "017e2447184bfeade7c238e4aefdd1e8f95b1e37" [
          (s."minimatch@^3.0.4")
          ];
        "ignore-walk@^3.0.1" = s."ignore-walk@3.0.3";
        "ignore@5.1.8" = f "ignore" "5.1.8" y "f150a8b50a34289b33e22f5889abd4d8016f0e57" [];
        "ignore@^5.1.4" = s."ignore@5.1.8";
        "immediate@3.2.3" = f "immediate" "3.2.3" y "d140fa8f614659bd6541233097ddaac25cdd991c" [];
        "immediate@^3.2.3" = s."immediate@3.2.3";
        "immediate@~3.2.3" = s."immediate@3.2.3";
        "import-fresh@3.2.1" = f "import-fresh" "3.2.1" y "633ff618506e793af5ac91bf48b72677e15cbe66" [
          (s."parent-module@^1.0.0")
          (s."resolve-from@^4.0.0")
          ];
        "import-fresh@^3.1.0" = s."import-fresh@3.2.1";
        "import-from@3.0.0" = f "import-from" "3.0.0" y "055cfec38cd5a27d8057ca51376d7d3bf0891966" [
          (s."resolve-from@^5.0.0")
          ];
        "import-from@^3.0.0" = s."import-from@3.0.0";
        "import-lazy@2.1.0" = f "import-lazy" "2.1.0" y "05698e3d45c88e8d7e9d92cb0584e77f096f3e43" [];
        "import-lazy@^2.1.0" = s."import-lazy@2.1.0";
        "import-local@2.0.0" = f "import-local" "2.0.0" y "55070be38a5993cf18ef6db7e961f5bee5c5a09d" [
          (s."pkg-dir@^3.0.0")
          (s."resolve-cwd@^2.0.0")
          ];
        "import-local@^2.0.0" = s."import-local@2.0.0";
        "imurmurhash@*" = s."imurmurhash@0.1.4";
        "imurmurhash@0.1.4" = f "imurmurhash" "0.1.4" y "9218b9b2b928a238b13dc4fb6b6d576f231453ea" [];
        "imurmurhash@^0.1.4" = s."imurmurhash@0.1.4";
        "indent-string@4.0.0" = f "indent-string" "4.0.0" y "624f8f4497d619b2d9768531d58f4122854d7251" [];
        "indent-string@^4.0.0" = s."indent-string@4.0.0";
        "infer-owner@1.0.4" = f "infer-owner" "1.0.4" y "c4cefcaa8e51051c2a40ba2ce8a3d27295af9467" [];
        "infer-owner@^1.0.3" = s."infer-owner@1.0.4";
        "infer-owner@^1.0.4" = s."infer-owner@1.0.4";
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inflight@~1.0.6" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.1" = f "inherits" "2.0.1" y "b17d08d326b4423e568eff719f91b0b1cbdf69f1" [];
        "inherits@2.0.3" = f "inherits" "2.0.3" y "633c2c83e3da42a502f52466022480f4208261de" [];
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "inherits@^2.0.1" = s."inherits@2.0.4";
        "inherits@^2.0.3" = s."inherits@2.0.4";
        "inherits@^2.0.4" = s."inherits@2.0.4";
        "inherits@~2.0.1" = s."inherits@2.0.4";
        "inherits@~2.0.3" = s."inherits@2.0.4";
        "inherits@~2.0.4" = s."inherits@2.0.4";
        "ini@1.3.5" = f "ini" "1.3.5" y "eee25f56db1c9ec6085e0c22778083f596abf927" [];
        "ini@^1.3.4" = s."ini@1.3.5";
        "ini@^1.3.5" = s."ini@1.3.5";
        "ini@~1.3.0" = s."ini@1.3.5";
        "init-package-json@1.10.3" = f "init-package-json" "1.10.3" y "45ffe2f610a8ca134f2bd1db5637b235070f6cbe" [
          (s."glob@^7.1.1")
          (s."npm-package-arg@^4.0.0 || ^5.0.0 || ^6.0.0")
          (s."promzard@^0.3.0")
          (s."read@~1.0.1")
          (s."read-package-json@1 || 2")
          (s."semver@2.x || 3.x || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
          (s."validate-npm-package-name@^3.0.0")
          ];
        "init-package-json@^1.10.3" = s."init-package-json@1.10.3";
        "interpret@1.4.0" = f "interpret" "1.4.0" y "665ab8bc4da27a774a40584e812e3e0fa45b1a1e" [];
        "interpret@^1.4.0" = s."interpret@1.4.0";
        "into-stream@5.1.1" = f "into-stream" "5.1.1" y "f9a20a348a11f3c13face22763f2d02e127f4db8" [
          (s."from2@^2.3.0")
          (s."p-is-promise@^3.0.0")
          ];
        "into-stream@^5.0.0" = s."into-stream@5.1.1";
        "invariant@2.2.4" = f "invariant" "2.2.4" y "610f3c92c9359ce1db616e538008d23ff35158e6" [
          (s."loose-envify@^1.0.0")
          ];
        "invariant@^2.2.2" = s."invariant@2.2.4";
        "invert-kv@2.0.0" = f "invert-kv" "2.0.0" y "7393f5afa59ec9ff5f67a27620d11c226e3eec02" [];
        "invert-kv@^2.0.0" = s."invert-kv@2.0.0";
        "ip-regex@2.1.0" = f "ip-regex" "2.1.0" y "fa78bf5d2e6913c911ce9f819ee5146bb6d844e9" [];
        "ip-regex@^2.1.0" = s."ip-regex@2.1.0";
        "ip@1.1.5" = f "ip" "1.1.5" y "bdded70114290828c0a039e72ef25f5aaec4354a" [];
        "ipaddr.js@1.9.1" = f "ipaddr.js" "1.9.1" y "bff38543eeb8984825079ff3a2a8e6cbd46781b3" [];
        "is-accessor-descriptor@0.1.6" = f "is-accessor-descriptor" "0.1.6" y "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6" [
          (s."kind-of@^3.0.2")
          ];
        "is-accessor-descriptor@1.0.0" = f "is-accessor-descriptor" "1.0.0" y "169c2f6d3df1f992618072365c9b0ea1f6878656" [
          (s."kind-of@^6.0.0")
          ];
        "is-accessor-descriptor@^0.1.6" = s."is-accessor-descriptor@0.1.6";
        "is-accessor-descriptor@^1.0.0" = s."is-accessor-descriptor@1.0.0";
        "is-arguments@1.0.4" = f "is-arguments" "1.0.4" y "3faf966c7cba0ff437fb31f6250082fcf0448cf3" [];
        "is-arguments@^1.0.4" = s."is-arguments@1.0.4";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-binary-path@1.0.1" = f "is-binary-path" "1.0.1" y "75f16642b480f187a711c814161fd3a4a7655898" [
          (s."binary-extensions@^1.0.0")
          ];
        "is-binary-path@2.1.0" = f "is-binary-path" "2.1.0" y "ea1f7f3b80f064236e83470f86c09c254fb45b09" [
          (s."binary-extensions@^2.0.0")
          ];
        "is-binary-path@^1.0.0" = s."is-binary-path@1.0.1";
        "is-binary-path@~2.1.0" = s."is-binary-path@2.1.0";
        "is-buffer@1.1.6" = f "is-buffer" "1.1.6" y "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be" [];
        "is-buffer@^1.1.5" = s."is-buffer@1.1.6";
        "is-callable@1.1.4" = f "is-callable" "1.1.4" y "1e1adf219e1eeb684d691f9d6a05ff0d30a24d75" [];
        "is-callable@1.2.2" = f "is-callable" "1.2.2" y "c7c6715cd22d4ddb48d3e19970223aceabb080d9" [];
        "is-callable@^1.1.3" = s."is-callable@1.2.2";
        "is-callable@^1.1.4" = s."is-callable@1.1.4";
        "is-callable@^1.2.2" = s."is-callable@1.2.2";
        "is-ci@1.2.1" = f "is-ci" "1.2.1" y "e3779c8ee17fccf428488f6e281187f2e632841c" [
          (s."ci-info@^1.5.0")
          ];
        "is-ci@2.0.0" = f "is-ci" "2.0.0" y "6bc6334181810e04b5c22b3d589fdca55026404c" [
          (s."ci-info@^2.0.0")
          ];
        "is-ci@^1.0.10" = s."is-ci@1.2.1";
        "is-ci@^2.0.0" = s."is-ci@2.0.0";
        "is-cidr@3.0.0" = f "is-cidr" "3.0.0" y "1acf35c9e881063cd5f696d48959b30fed3eed56" [
          (s."cidr-regex@^2.0.10")
          ];
        "is-cidr@^3.0.0" = s."is-cidr@3.0.0";
        "is-data-descriptor@0.1.4" = f "is-data-descriptor" "0.1.4" y "0b5ee648388e2c860282e793f1856fec3f301b56" [
          (s."kind-of@^3.0.2")
          ];
        "is-data-descriptor@1.0.0" = f "is-data-descriptor" "1.0.0" y "d84876321d0e7add03990406abbbbd36ba9268c7" [
          (s."kind-of@^6.0.0")
          ];
        "is-data-descriptor@^0.1.4" = s."is-data-descriptor@0.1.4";
        "is-data-descriptor@^1.0.0" = s."is-data-descriptor@1.0.0";
        "is-date-object@1.0.2" = f "is-date-object" "1.0.2" y "bda736f2cd8fd06d32844e7743bfa7494c3bfd7e" [];
        "is-date-object@^1.0.1" = s."is-date-object@1.0.2";
        "is-descriptor@0.1.6" = f "is-descriptor" "0.1.6" y "366d8240dde487ca51823b1ab9f07a10a78251ca" [
          (s."is-accessor-descriptor@^0.1.6")
          (s."is-data-descriptor@^0.1.4")
          (s."kind-of@^5.0.0")
          ];
        "is-descriptor@1.0.2" = f "is-descriptor" "1.0.2" y "3b159746a66604b04f8c81524ba365c5f14d86ec" [
          (s."is-accessor-descriptor@^1.0.0")
          (s."is-data-descriptor@^1.0.0")
          (s."kind-of@^6.0.2")
          ];
        "is-descriptor@^0.1.0" = s."is-descriptor@0.1.6";
        "is-descriptor@^1.0.0" = s."is-descriptor@1.0.2";
        "is-descriptor@^1.0.2" = s."is-descriptor@1.0.2";
        "is-extendable@0.1.1" = f "is-extendable" "0.1.1" y "62b110e289a471418e3ec36a617d472e301dfc89" [];
        "is-extendable@1.0.1" = f "is-extendable" "1.0.1" y "a7470f9e426733d81bd81e1155264e3a3507cab4" [
          (s."is-plain-object@^2.0.4")
          ];
        "is-extendable@^0.1.0" = s."is-extendable@0.1.1";
        "is-extendable@^0.1.1" = s."is-extendable@0.1.1";
        "is-extendable@^1.0.1" = s."is-extendable@1.0.1";
        "is-extglob@2.1.1" = f "is-extglob" "2.1.1" y "a88c02535791f02ed37c76a1b9ea9773c833f8c2" [];
        "is-extglob@^2.1.0" = s."is-extglob@2.1.1";
        "is-extglob@^2.1.1" = s."is-extglob@2.1.1";
        "is-finite@1.1.0" = f "is-finite" "1.1.0" y "904135c77fb42c0641d6aa1bcdbc4daa8da082f3" [];
        "is-finite@^1.0.0" = s."is-finite@1.1.0";
        "is-fn@1.0.0" = f "is-fn" "1.0.0" y "9543d5de7bcf5b08a22ec8a20bae6e286d510d8c" [];
        "is-fn@^1.0.0" = s."is-fn@1.0.0";
        "is-fullwidth-code-point@1.0.0" = f "is-fullwidth-code-point" "1.0.0" y "ef9e31386f031a7f0d643af82fde50c457ef00cb" [
          (s."number-is-nan@^1.0.0")
          ];
        "is-fullwidth-code-point@2.0.0" = f "is-fullwidth-code-point" "2.0.0" y "a3b30a5c4f199183167aaab93beefae3ddfb654f" [];
        "is-fullwidth-code-point@3.0.0" = f "is-fullwidth-code-point" "3.0.0" y "f116f8064fe90b3f7844a38997c0b75051269f1d" [];
        "is-fullwidth-code-point@^1.0.0" = s."is-fullwidth-code-point@1.0.0";
        "is-fullwidth-code-point@^2.0.0" = s."is-fullwidth-code-point@2.0.0";
        "is-fullwidth-code-point@^3.0.0" = s."is-fullwidth-code-point@3.0.0";
        "is-function@1.0.2" = f "is-function" "1.0.2" y "4f097f30abf6efadac9833b17ca5dc03f8144e08" [];
        "is-function@^1.0.1" = s."is-function@1.0.2";
        "is-glob@3.1.0" = f "is-glob" "3.1.0" y "7ba5ae24217804ac70707b96922567486cc3e84a" [
          (s."is-extglob@^2.1.0")
          ];
        "is-glob@4.0.1" = f "is-glob" "4.0.1" y "7567dbe9f2f5e2467bc77ab83c4a29482407a5dc" [
          (s."is-extglob@^2.1.1")
          ];
        "is-glob@^3.1.0" = s."is-glob@3.1.0";
        "is-glob@^4.0.0" = s."is-glob@4.0.1";
        "is-glob@^4.0.1" = s."is-glob@4.0.1";
        "is-glob@~4.0.1" = s."is-glob@4.0.1";
        "is-hex-prefixed@1.0.0" = f "is-hex-prefixed" "1.0.0" y "7d8d37e6ad77e5d127148913c573e082d777f554" [];
        "is-installed-globally@0.1.0" = f "is-installed-globally" "0.1.0" y "0dfd98f5a9111716dd535dda6492f67bf3d25a80" [
          (s."global-dirs@^0.1.0")
          (s."is-path-inside@^1.0.0")
          ];
        "is-installed-globally@^0.1.0" = s."is-installed-globally@0.1.0";
        "is-negative-zero@2.0.0" = f "is-negative-zero" "2.0.0" y "9553b121b0fac28869da9ed459e20c7543788461" [];
        "is-negative-zero@^2.0.0" = s."is-negative-zero@2.0.0";
        "is-npm@1.0.0" = f "is-npm" "1.0.0" y "f2fb63a65e4905b406c86072765a1a4dc793b9f4" [];
        "is-npm@^1.0.0" = s."is-npm@1.0.0";
        "is-number@3.0.0" = f "is-number" "3.0.0" y "24fd6201a4782cf50561c810276afc7d12d71195" [
          (s."kind-of@^3.0.2")
          ];
        "is-number@7.0.0" = f "is-number" "7.0.0" y "7535345b896734d5f80c4d06c50955527a14f12b" [];
        "is-number@^3.0.0" = s."is-number@3.0.0";
        "is-number@^7.0.0" = s."is-number@7.0.0";
        "is-obj@1.0.1" = f "is-obj" "1.0.1" y "3e4729ac1f5fde025cd7d83a896dab9f4f67db0f" [];
        "is-obj@2.0.0" = f "is-obj" "2.0.0" y "473fb05d973705e3fd9620545018ca8e22ef4982" [];
        "is-obj@^1.0.0" = s."is-obj@1.0.1";
        "is-obj@^2.0.0" = s."is-obj@2.0.0";
        "is-object@1.0.1" = f "is-object" "1.0.1" y "8952688c5ec2ffd6b03ecc85e769e02903083470" [];
        "is-object@^1.0.1" = s."is-object@1.0.1";
        "is-path-inside@1.0.1" = f "is-path-inside" "1.0.1" y "8ef5b7de50437a3fdca6b4e865ef7aa55cb48036" [
          (s."path-is-inside@^1.0.1")
          ];
        "is-path-inside@^1.0.0" = s."is-path-inside@1.0.1";
        "is-plain-obj@1.1.0" = f "is-plain-obj" "1.1.0" y "71a50c8429dfca773c92a390a4a03b39fcd51d3e" [];
        "is-plain-obj@^1.1.0" = s."is-plain-obj@1.1.0";
        "is-plain-object@2.0.4" = f "is-plain-object" "2.0.4" y "2c163b3fafb1b606d9d17928f05c2a1c38e07677" [
          (s."isobject@^3.0.1")
          ];
        "is-plain-object@5.0.0" = f "is-plain-object" "5.0.0" y "4427f50ab3429e9025ea7d52e9043a9ef4159344" [];
        "is-plain-object@^2.0.3" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.4" = s."is-plain-object@2.0.4";
        "is-plain-object@^5.0.0" = s."is-plain-object@5.0.0";
        "is-redirect@1.0.0" = f "is-redirect" "1.0.0" y "1d03dded53bd8db0f30c26e4f95d36fc7c87dc24" [];
        "is-redirect@^1.0.0" = s."is-redirect@1.0.0";
        "is-regex@1.0.5" = f "is-regex" "1.0.5" y "39d589a358bf18967f726967120b8fc1aed74eae" [
          (s."has@^1.0.3")
          ];
        "is-regex@1.1.1" = f "is-regex" "1.1.1" y "c6f98aacc546f6cec5468a07b7b153ab564a57b9" [
          (s."has-symbols@^1.0.1")
          ];
        "is-regex@^1.0.4" = s."is-regex@1.1.1";
        "is-regex@^1.1.1" = s."is-regex@1.1.1";
        "is-regex@~1.0.5" = s."is-regex@1.0.5";
        "is-retry-allowed@1.2.0" = f "is-retry-allowed" "1.2.0" y "d778488bd0a4666a3be8a1482b9f2baafedea8b4" [];
        "is-retry-allowed@^1.0.0" = s."is-retry-allowed@1.2.0";
        "is-stream@1.1.0" = f "is-stream" "1.1.0" y "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44" [];
        "is-stream@2.0.0" = f "is-stream" "2.0.0" y "bde9c32680d6fae04129d6ac9d921ce7815f78e3" [];
        "is-stream@^1.0.0" = s."is-stream@1.1.0";
        "is-stream@^1.0.1" = s."is-stream@1.1.0";
        "is-stream@^1.1.0" = s."is-stream@1.1.0";
        "is-stream@^2.0.0" = s."is-stream@2.0.0";
        "is-symbol@1.0.2" = f "is-symbol" "1.0.2" y "a055f6ae57192caee329e7a860118b497a950f38" [
          (s."has-symbols@^1.0.0")
          ];
        "is-symbol@^1.0.2" = s."is-symbol@1.0.2";
        "is-text-path@1.0.1" = f "is-text-path" "1.0.1" y "4e1aa0fb51bfbcb3e92688001397202c1775b66e" [
          (s."text-extensions@^1.0.0")
          ];
        "is-text-path@^1.0.1" = s."is-text-path@1.0.1";
        "is-typedarray@1.0.0" = f "is-typedarray" "1.0.0" y "e479c80858df0c1b11ddda6940f96011fcda4a9a" [];
        "is-typedarray@^1.0.0" = s."is-typedarray@1.0.0";
        "is-typedarray@~1.0.0" = s."is-typedarray@1.0.0";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.1" = s."is-windows@1.0.2";
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "is-wsl@1.1.0" = f "is-wsl" "1.1.0" y "1f16e4aa22b04d1336b66188a66af3c600c3a66d" [];
        "is-wsl@^1.1.0" = s."is-wsl@1.1.0";
        "isarray@0.0.1" = f "isarray" "0.0.1" y "8a18acfca9a8f4177e09abfc6038939b05d1eedf" [];
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@^1.0.0" = s."isarray@1.0.0";
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
          ];
        "isobject@3.0.1" = f "isobject" "3.0.1" y "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df" [];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isobject@^3.0.0" = s."isobject@3.0.1";
        "isobject@^3.0.1" = s."isobject@3.0.1";
        "isstream@0.1.2" = f "isstream" "0.1.2" y "47e63f7af55afa6f92e1500e690eb8b8529c099a" [];
        "isstream@~0.1.2" = s."isstream@0.1.2";
        "issue-parser@6.0.0" = f "issue-parser" "6.0.0" y "b1edd06315d4f2044a9755daf85fdafde9b4014a" [
          (s."lodash.capitalize@^4.2.1")
          (s."lodash.escaperegexp@^4.1.2")
          (s."lodash.isplainobject@^4.0.6")
          (s."lodash.isstring@^4.0.1")
          (s."lodash.uniqby@^4.7.0")
          ];
        "issue-parser@^6.0.0" = s."issue-parser@6.0.0";
        "isurl@1.0.0" = f "isurl" "1.0.0" y "b27f4f49f3cdaa3ea44a0a5b7f3462e6edc39d67" [
          (s."has-to-string-tag-x@^1.2.0")
          (s."is-object@^1.0.1")
          ];
        "isurl@^1.0.0-alpha5" = s."isurl@1.0.0";
        "java-properties@1.0.2" = f "java-properties" "1.0.2" y "ccd1fa73907438a5b5c38982269d0e771fe78211" [];
        "java-properties@^1.0.0" = s."java-properties@1.0.2";
        "js-sha3@0.5.7" = f "js-sha3" "0.5.7" y "0d4ffd8002d5333aabaf4a23eed2f6374c9f28e7" [];
        "js-sha3@0.8.0" = f "js-sha3" "0.8.0" y "b9b7a5da73afad7dedd0f8c463954cbde6818840" [];
        "js-sha3@^0.5.7" = s."js-sha3@0.5.7";
        "js-sha3@^0.8.0" = s."js-sha3@0.8.0";
        "js-tokens@3.0.2" = f "js-tokens" "3.0.2" y "9866df395102130e38f7f996bceb65443209c25b" [];
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^3.0.0 || ^4.0.0" = s."js-tokens@4.0.0";
        "js-tokens@^3.0.2" = s."js-tokens@3.0.2";
        "js-tokens@^4.0.0" = s."js-tokens@4.0.0";
        "jsbn@0.1.1" = f "jsbn" "0.1.1" y "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513" [];
        "jsbn@~0.1.0" = s."jsbn@0.1.1";
        "jsesc@0.5.0" = f "jsesc" "0.5.0" y "e7dee66e35d6fc16f710fe91d5cf69f70f08911d" [];
        "jsesc@1.3.0" = f "jsesc" "1.3.0" y "46c3fec8c1892b12b0833db9bc7622176dbab34b" [];
        "jsesc@^1.3.0" = s."jsesc@1.3.0";
        "jsesc@~0.5.0" = s."jsesc@0.5.0";
        "json-buffer@3.0.0" = f "json-buffer" "3.0.0" y "5b1f397afc75d677bde8bcfc0e47e1f9a3d9a898" [];
        "json-parse-better-errors@1.0.2" = f "json-parse-better-errors" "1.0.2" y "bb867cfb3450e69107c131d1c514bab3dc8bcaa9" [];
        "json-parse-better-errors@^1.0.0" = s."json-parse-better-errors@1.0.2";
        "json-parse-better-errors@^1.0.1" = s."json-parse-better-errors@1.0.2";
        "json-parse-better-errors@^1.0.2" = s."json-parse-better-errors@1.0.2";
        "json-parse-even-better-errors@2.3.1" = f "json-parse-even-better-errors" "2.3.1" y "7c47805a94319928e05777405dc12e1f7a4ee02d" [];
        "json-parse-even-better-errors@^2.3.0" = s."json-parse-even-better-errors@2.3.1";
        "json-rpc-engine@3.8.0" = f "json-rpc-engine" "3.8.0" y "9d4ff447241792e1d0a232f6ef927302bb0c62a9" [
          (s."async@^2.0.1")
          (s."babel-preset-env@^1.7.0")
          (s."babelify@^7.3.0")
          (s."json-rpc-error@^2.0.0")
          (s."promise-to-callback@^1.0.0")
          (s."safe-event-emitter@^1.0.1")
          ];
        "json-rpc-engine@^3.4.0" = s."json-rpc-engine@3.8.0";
        "json-rpc-engine@^3.6.0" = s."json-rpc-engine@3.8.0";
        "json-rpc-error@2.0.0" = f "json-rpc-error" "2.0.0" y "a7af9c202838b5e905c7250e547f1aff77258a02" [
          (s."inherits@^2.0.1")
          ];
        "json-rpc-error@^2.0.0" = s."json-rpc-error@2.0.0";
        "json-rpc-random-id@1.0.1" = f "json-rpc-random-id" "1.0.1" y "ba49d96aded1444dbb8da3d203748acbbcdec8c8" [];
        "json-rpc-random-id@^1.0.0" = s."json-rpc-random-id@1.0.1";
        "json-schema-traverse@0.3.1" = f "json-schema-traverse" "0.3.1" y "349a6d44c53a51de89b40805c5d5e59b417d3340" [];
        "json-schema-traverse@0.4.1" = f "json-schema-traverse" "0.4.1" y "69f6a87d9513ab8bb8fe63bdb0979c448e684660" [];
        "json-schema-traverse@^0.3.0" = s."json-schema-traverse@0.3.1";
        "json-schema-traverse@^0.4.1" = s."json-schema-traverse@0.4.1";
        "json-schema@0.2.3" = f "json-schema" "0.2.3" y "b480c892e59a2f05954ce727bd3f2a4e882f9e13" [];
        "json-stable-stringify@1.0.1" = f "json-stable-stringify" "1.0.1" y "9a759d39c5f2ff503fd5300646ed445f88c4f9af" [
          (s."jsonify@~0.0.0")
          ];
        "json-stable-stringify@^1.0.1" = s."json-stable-stringify@1.0.1";
        "json-stringify-safe@5.0.1" = f "json-stringify-safe" "5.0.1" y "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb" [];
        "json-stringify-safe@^5.0.1" = s."json-stringify-safe@5.0.1";
        "json-stringify-safe@~5.0.1" = s."json-stringify-safe@5.0.1";
        "json5@0.5.1" = f "json5" "0.5.1" y "1eade7acc012034ad84e2396767ead9fa5495821" [];
        "json5@1.0.1" = f "json5" "1.0.1" y "779fb0018604fa854eacbf6252180d83543e3dbe" [
          (s."minimist@^1.2.0")
          ];
        "json5@^0.5.1" = s."json5@0.5.1";
        "json5@^1.0.1" = s."json5@1.0.1";
        "jsonfile@4.0.0" = f "jsonfile" "4.0.0" y "8771aae0799b64076b76640fca058f9c10e33ecb" [
          (s."graceful-fs@^4.1.6")
          ];
        "jsonfile@6.0.1" = f "jsonfile" "6.0.1" y "98966cba214378c8c84b82e085907b40bf614179" [
          (s."universalify@^1.0.0")
          (s."graceful-fs@^4.1.6")
          ];
        "jsonfile@^4.0.0" = s."jsonfile@4.0.0";
        "jsonfile@^6.0.1" = s."jsonfile@6.0.1";
        "jsonify@0.0.0" = f "jsonify" "0.0.0" y "2c74b6ee41d93ca51b7b5aaee8f503631d252a73" [];
        "jsonify@~0.0.0" = s."jsonify@0.0.0";
        "jsonparse@1.3.1" = f "jsonparse" "1.3.1" y "3f4dae4a91fac315f71062f8521cc239f1366280" [];
        "jsonparse@^1.2.0" = s."jsonparse@1.3.1";
        "jsprim@1.4.1" = f "jsprim" "1.4.1" y "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2" [
          (s."assert-plus@1.0.0")
          (s."extsprintf@1.3.0")
          (s."json-schema@0.2.3")
          (s."verror@1.10.0")
          ];
        "jsprim@^1.2.2" = s."jsprim@1.4.1";
        "keccak@3.0.1" = f "keccak" "3.0.1" y "ae30a0e94dbe43414f741375cff6d64c8bea0bff" [
          (s."node-addon-api@^2.0.0")
          (s."node-gyp-build@^4.2.0")
          ];
        "keccak@^3.0.0" = s."keccak@3.0.1";
        "keyv@3.1.0" = f "keyv" "3.1.0" y "ecc228486f69991e49e9476485a5be1e8fc5c4d9" [
          (s."json-buffer@3.0.0")
          ];
        "keyv@^3.0.0" = s."keyv@3.1.0";
        "kind-of@3.2.2" = f "kind-of" "3.2.2" y "31ea21a734bab9bbb0f32466d893aea51e4a3c64" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@4.0.0" = f "kind-of" "4.0.0" y "20813df3d712928b207378691a45066fae72dd57" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@5.1.0" = f "kind-of" "5.1.0" y "729c91e2d857b7a419a1f9aa65685c4c33f5845d" [];
        "kind-of@6.0.3" = f "kind-of" "6.0.3" y "07c05034a6c349fa06e24fa35aa76db4580ce4dd" [];
        "kind-of@^3.0.2" = s."kind-of@3.2.2";
        "kind-of@^3.0.3" = s."kind-of@3.2.2";
        "kind-of@^3.2.0" = s."kind-of@3.2.2";
        "kind-of@^4.0.0" = s."kind-of@4.0.0";
        "kind-of@^5.0.0" = s."kind-of@5.1.0";
        "kind-of@^6.0.0" = s."kind-of@6.0.3";
        "kind-of@^6.0.2" = s."kind-of@6.0.3";
        "kind-of@^6.0.3" = s."kind-of@6.0.3";
        "klaw-sync@6.0.0" = f "klaw-sync" "6.0.0" y "1fd2cfd56ebb6250181114f0a581167099c2b28c" [
          (s."graceful-fs@^4.1.11")
          ];
        "klaw-sync@^6.0.0" = s."klaw-sync@6.0.0";
        "latest-version@3.1.0" = f "latest-version" "3.1.0" y "a205383fea322b33b5ae3b18abee0dc2f356ee15" [
          (s."package-json@^4.0.0")
          ];
        "latest-version@^3.0.0" = s."latest-version@3.1.0";
        "lazy-property@1.0.0" = f "lazy-property" "1.0.0" y "84ddc4b370679ba8bd4cdcfa4c06b43d57111147" [];
        "lazy-property@~1.0.0" = s."lazy-property@1.0.0";
        "lcid@2.0.0" = f "lcid" "2.0.0" y "6ef5d2df60e52f82eb228a4c373e8d1f397253cf" [
          (s."invert-kv@^2.0.0")
          ];
        "lcid@^2.0.0" = s."lcid@2.0.0";
        "level-codec@7.0.1" = f "level-codec" "7.0.1" y "341f22f907ce0f16763f24bddd681e395a0fb8a7" [];
        "level-codec@9.0.2" = f "level-codec" "9.0.2" y "fd60df8c64786a80d44e63423096ffead63d8cbc" [
          (s."buffer@^5.6.0")
          ];
        "level-codec@^9.0.0" = s."level-codec@9.0.2";
        "level-codec@~7.0.0" = s."level-codec@7.0.1";
        "level-errors@1.0.5" = f "level-errors" "1.0.5" y "83dbfb12f0b8a2516bdc9a31c4876038e227b859" [
          (s."errno@~0.1.1")
          ];
        "level-errors@2.0.1" = f "level-errors" "2.0.1" y "2132a677bf4e679ce029f517c2f17432800c05c8" [
          (s."errno@~0.1.1")
          ];
        "level-errors@^1.0.3" = s."level-errors@1.0.5";
        "level-errors@^2.0.0" = s."level-errors@2.0.1";
        "level-errors@~1.0.3" = s."level-errors@1.0.5";
        "level-errors@~2.0.0" = s."level-errors@2.0.1";
        "level-iterator-stream@1.3.1" = f "level-iterator-stream" "1.3.1" y "e43b78b1a8143e6fa97a4f485eb8ea530352f2ed" [
          (s."inherits@^2.0.1")
          (s."level-errors@^1.0.3")
          (s."readable-stream@^1.0.33")
          (s."xtend@^4.0.0")
          ];
        "level-iterator-stream@2.0.3" = f "level-iterator-stream" "2.0.3" y "ccfff7c046dcf47955ae9a86f46dfa06a31688b4" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.5")
          (s."xtend@^4.0.0")
          ];
        "level-iterator-stream@3.0.1" = f "level-iterator-stream" "3.0.1" y "2c98a4f8820d87cdacab3132506815419077c730" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.3.6")
          (s."xtend@^4.0.0")
          ];
        "level-iterator-stream@^2.0.3" = s."level-iterator-stream@2.0.3";
        "level-iterator-stream@~1.3.0" = s."level-iterator-stream@1.3.1";
        "level-iterator-stream@~3.0.0" = s."level-iterator-stream@3.0.1";
        "level-mem@3.0.1" = f "level-mem" "3.0.1" y "7ce8cf256eac40f716eb6489654726247f5a89e5" [
          (s."level-packager@~4.0.0")
          (s."memdown@~3.0.0")
          ];
        "level-mem@^3.0.1" = s."level-mem@3.0.1";
        "level-packager@4.0.1" = f "level-packager" "4.0.1" y "7e7d3016af005be0869bc5fa8de93d2a7f56ffe6" [
          (s."encoding-down@~5.0.0")
          (s."levelup@^3.0.0")
          ];
        "level-packager@~4.0.0" = s."level-packager@4.0.1";
        "level-post@1.0.7" = f "level-post" "1.0.7" y "19ccca9441a7cc527879a0635000f06d5e8f27d0" [
          (s."ltgt@^2.1.2")
          ];
        "level-post@^1.0.7" = s."level-post@1.0.7";
        "level-sublevel@6.6.4" = f "level-sublevel" "6.6.4" y "f7844ae893919cd9d69ae19d7159499afd5352ba" [
          (s."bytewise@~1.1.0")
          (s."level-codec@^9.0.0")
          (s."level-errors@^2.0.0")
          (s."level-iterator-stream@^2.0.3")
          (s."ltgt@~2.1.1")
          (s."pull-defer@^0.2.2")
          (s."pull-level@^2.0.3")
          (s."pull-stream@^3.6.8")
          (s."typewiselite@~1.0.0")
          (s."xtend@~4.0.0")
          ];
        "level-ws@0.0.0" = f "level-ws" "0.0.0" y "372e512177924a00424b0b43aef2bb42496d228b" [
          (s."readable-stream@~1.0.15")
          (s."xtend@~2.1.1")
          ];
        "level-ws@1.0.0" = f "level-ws" "1.0.0" y "19a22d2d4ac57b18cc7c6ecc4bd23d899d8f603b" [
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.8")
          (s."xtend@^4.0.1")
          ];
        "level-ws@^1.0.0" = s."level-ws@1.0.0";
        "levelup@1.3.9" = f "levelup" "1.3.9" y "2dbcae845b2bb2b6bea84df334c475533bbd82ab" [
          (s."deferred-leveldown@~1.2.1")
          (s."level-codec@~7.0.0")
          (s."level-errors@~1.0.3")
          (s."level-iterator-stream@~1.3.0")
          (s."prr@~1.0.1")
          (s."semver@~5.4.1")
          (s."xtend@~4.0.0")
          ];
        "levelup@3.1.1" = f "levelup" "3.1.1" y "c2c0b3be2b4dc316647c53b42e2f559e232d2189" [
          (s."deferred-leveldown@~4.0.0")
          (s."level-errors@~2.0.0")
          (s."level-iterator-stream@~3.0.0")
          (s."xtend@~4.0.0")
          ];
        "levelup@^1.2.1" = s."levelup@1.3.9";
        "levelup@^3.0.0" = s."levelup@3.1.1";
        "libcipm@4.0.8" = f "libcipm" "4.0.8" y "dcea4919e10dfbce420327e63901613b9141bc89" [
          (s."bin-links@^1.1.2")
          (s."bluebird@^3.5.1")
          (s."figgy-pudding@^3.5.1")
          (s."find-npm-prefix@^1.0.2")
          (s."graceful-fs@^4.1.11")
          (s."ini@^1.3.5")
          (s."lock-verify@^2.1.0")
          (s."mkdirp@^0.5.1")
          (s."npm-lifecycle@^3.0.0")
          (s."npm-logical-tree@^1.2.1")
          (s."npm-package-arg@^6.1.0")
          (s."pacote@^9.1.0")
          (s."read-package-json@^2.0.13")
          (s."rimraf@^2.6.2")
          (s."worker-farm@^1.6.0")
          ];
        "libcipm@^4.0.8" = s."libcipm@4.0.8";
        "libnpm@3.0.1" = f "libnpm" "3.0.1" y "0be11b4c9dd4d1ffd7d95c786e92e55d65be77a2" [
          (s."bin-links@^1.1.2")
          (s."bluebird@^3.5.3")
          (s."find-npm-prefix@^1.0.2")
          (s."libnpmaccess@^3.0.2")
          (s."libnpmconfig@^1.2.1")
          (s."libnpmhook@^5.0.3")
          (s."libnpmorg@^1.0.1")
          (s."libnpmpublish@^1.1.2")
          (s."libnpmsearch@^2.0.2")
          (s."libnpmteam@^1.0.2")
          (s."lock-verify@^2.0.2")
          (s."npm-lifecycle@^3.0.0")
          (s."npm-logical-tree@^1.2.1")
          (s."npm-package-arg@^6.1.0")
          (s."npm-profile@^4.0.2")
          (s."npm-registry-fetch@^4.0.0")
          (s."npmlog@^4.1.2")
          (s."pacote@^9.5.3")
          (s."read-package-json@^2.0.13")
          (s."stringify-package@^1.0.0")
          ];
        "libnpm@^3.0.1" = s."libnpm@3.0.1";
        "libnpmaccess@3.0.2" = f "libnpmaccess" "3.0.2" y "8b2d72345ba3bef90d3b4f694edd5c0417f58923" [
          (s."aproba@^2.0.0")
          (s."get-stream@^4.0.0")
          (s."npm-package-arg@^6.1.0")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "libnpmaccess@^3.0.2" = s."libnpmaccess@3.0.2";
        "libnpmconfig@1.2.1" = f "libnpmconfig" "1.2.1" y "c0c2f793a74e67d4825e5039e7a02a0044dfcbc0" [
          (s."figgy-pudding@^3.5.1")
          (s."find-up@^3.0.0")
          (s."ini@^1.3.5")
          ];
        "libnpmconfig@^1.2.1" = s."libnpmconfig@1.2.1";
        "libnpmhook@5.0.3" = f "libnpmhook" "5.0.3" y "4020c0f5edbf08ebe395325caa5ea01885b928f7" [
          (s."aproba@^2.0.0")
          (s."figgy-pudding@^3.4.1")
          (s."get-stream@^4.0.0")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "libnpmhook@^5.0.3" = s."libnpmhook@5.0.3";
        "libnpmorg@1.0.1" = f "libnpmorg" "1.0.1" y "5d2503f6ceb57f33dbdcc718e6698fea6d5ad087" [
          (s."aproba@^2.0.0")
          (s."figgy-pudding@^3.4.1")
          (s."get-stream@^4.0.0")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "libnpmorg@^1.0.1" = s."libnpmorg@1.0.1";
        "libnpmpublish@1.1.2" = f "libnpmpublish" "1.1.2" y "4201cfc4a69c44e6f454ec548fa1cd90f10df0a0" [
          (s."aproba@^2.0.0")
          (s."figgy-pudding@^3.5.1")
          (s."get-stream@^4.0.0")
          (s."lodash.clonedeep@^4.5.0")
          (s."normalize-package-data@^2.4.0")
          (s."npm-package-arg@^6.1.0")
          (s."npm-registry-fetch@^4.0.0")
          (s."semver@^5.5.1")
          (s."ssri@^6.0.1")
          ];
        "libnpmpublish@^1.1.2" = s."libnpmpublish@1.1.2";
        "libnpmsearch@2.0.2" = f "libnpmsearch" "2.0.2" y "9a4f059102d38e3dd44085bdbfe5095f2a5044cf" [
          (s."figgy-pudding@^3.5.1")
          (s."get-stream@^4.0.0")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "libnpmsearch@^2.0.2" = s."libnpmsearch@2.0.2";
        "libnpmteam@1.0.2" = f "libnpmteam" "1.0.2" y "8b48bcbb6ce70dd8150c950fcbdbf3feb6eec820" [
          (s."aproba@^2.0.0")
          (s."figgy-pudding@^3.4.1")
          (s."get-stream@^4.0.0")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "libnpmteam@^1.0.2" = s."libnpmteam@1.0.2";
        "libnpx@10.2.4" = f "libnpx" "10.2.4" y "ef0e3258e29aef2ec7ee3276115e20e67f67d4ee" [
          (s."dotenv@^5.0.1")
          (s."npm-package-arg@^6.0.0")
          (s."rimraf@^2.6.2")
          (s."safe-buffer@^5.1.0")
          (s."update-notifier@^2.3.0")
          (s."which@^1.3.0")
          (s."y18n@^4.0.0")
          (s."yargs@^14.2.3")
          ];
        "libnpx@^10.2.4" = s."libnpx@10.2.4";
        "lines-and-columns@1.1.6" = f "lines-and-columns" "1.1.6" y "1c00c743b433cd0a4e80758f7b64a57440d9ff00" [];
        "lines-and-columns@^1.1.6" = s."lines-and-columns@1.1.6";
        "load-json-file@4.0.0" = f "load-json-file" "4.0.0" y "2f5f45ab91e33216234fd53adab668eb4ec0993b" [
          (s."graceful-fs@^4.1.2")
          (s."parse-json@^4.0.0")
          (s."pify@^3.0.0")
          (s."strip-bom@^3.0.0")
          ];
        "load-json-file@^4.0.0" = s."load-json-file@4.0.0";
        "loader-runner@2.4.0" = f "loader-runner" "2.4.0" y "ed47066bfe534d7e84c4c7b9998c2a75607d9357" [];
        "loader-runner@^2.4.0" = s."loader-runner@2.4.0";
        "loader-utils@1.4.0" = f "loader-utils" "1.4.0" y "c579b5e34cb34b1a74edc6c1fb36bfa371d5a613" [
          (s."big.js@^5.2.2")
          (s."emojis-list@^3.0.0")
          (s."json5@^1.0.1")
          ];
        "loader-utils@^1.2.3" = s."loader-utils@1.4.0";
        "loader-utils@^1.4.0" = s."loader-utils@1.4.0";
        "locate-path@2.0.0" = f "locate-path" "2.0.0" y "2b568b265eec944c6d9c0de9c3dbbbca0354cd8e" [
          (s."p-locate@^2.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@3.0.0" = f "locate-path" "3.0.0" y "dbec3b3ab759758071b58fe59fc41871af21400e" [
          (s."p-locate@^3.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@5.0.0" = f "locate-path" "5.0.0" y "1afba396afd676a6d42504d0a67a3a7eb9f62aa0" [
          (s."p-locate@^4.1.0")
          ];
        "locate-path@^2.0.0" = s."locate-path@2.0.0";
        "locate-path@^3.0.0" = s."locate-path@3.0.0";
        "locate-path@^5.0.0" = s."locate-path@5.0.0";
        "lock-verify@2.1.0" = f "lock-verify" "2.1.0" y "fff4c918b8db9497af0c5fa7f6d71555de3ceb47" [
          (s."npm-package-arg@^6.1.0")
          (s."semver@^5.4.1")
          ];
        "lock-verify@^2.0.2" = s."lock-verify@2.1.0";
        "lock-verify@^2.1.0" = s."lock-verify@2.1.0";
        "lockfile@1.0.4" = f "lockfile" "1.0.4" y "07f819d25ae48f87e538e6578b6964a4981a5609" [
          (s."signal-exit@^3.0.2")
          ];
        "lockfile@^1.0.4" = s."lockfile@1.0.4";
        "lodash._baseindexof@*" = s."lodash._baseindexof@3.1.0";
        "lodash._baseindexof@3.1.0" = f "lodash._baseindexof" "3.1.0" y "fe52b53a1c6761e42618d654e4a25789ed61822c" [];
        "lodash._baseuniq@4.6.0" = f "lodash._baseuniq" "4.6.0" y "0ebb44e456814af7905c6212fa2c9b2d51b841e8" [
          (s."lodash._createset@~4.0.0")
          (s."lodash._root@~3.0.0")
          ];
        "lodash._baseuniq@~4.6.0" = s."lodash._baseuniq@4.6.0";
        "lodash._bindcallback@*" = s."lodash._bindcallback@3.0.1";
        "lodash._bindcallback@3.0.1" = f "lodash._bindcallback" "3.0.1" y "e531c27644cf8b57a99e17ed95b35c748789392e" [];
        "lodash._cacheindexof@*" = s."lodash._cacheindexof@3.0.2";
        "lodash._cacheindexof@3.0.2" = f "lodash._cacheindexof" "3.0.2" y "3dc69ac82498d2ee5e3ce56091bafd2adc7bde92" [];
        "lodash._createcache@*" = s."lodash._createcache@3.1.2";
        "lodash._createcache@3.1.2" = f "lodash._createcache" "3.1.2" y "56d6a064017625e79ebca6b8018e17440bdcf093" [
          (s."lodash._getnative@^3.0.0")
          ];
        "lodash._createset@4.0.3" = f "lodash._createset" "4.0.3" y "0f4659fbb09d75194fa9e2b88a6644d363c9fe26" [];
        "lodash._createset@~4.0.0" = s."lodash._createset@4.0.3";
        "lodash._getnative@*" = s."lodash._getnative@3.9.1";
        "lodash._getnative@3.9.1" = f "lodash._getnative" "3.9.1" y "570bc7dede46d61cdcde687d65d3eecbaa3aaff5" [];
        "lodash._getnative@^3.0.0" = s."lodash._getnative@3.9.1";
        "lodash._root@3.0.1" = f "lodash._root" "3.0.1" y "fba1c4524c19ee9a5f8136b4609f017cf4ded692" [];
        "lodash._root@~3.0.0" = s."lodash._root@3.0.1";
        "lodash.capitalize@4.2.1" = f "lodash.capitalize" "4.2.1" y "f826c9b4e2a8511d84e3aca29db05e1a4f3b72a9" [];
        "lodash.capitalize@^4.2.1" = s."lodash.capitalize@4.2.1";
        "lodash.clonedeep@4.5.0" = f "lodash.clonedeep" "4.5.0" y "e23f3f9c4f8fbdde872529c1071857a086e5ccef" [];
        "lodash.clonedeep@^4.5.0" = s."lodash.clonedeep@4.5.0";
        "lodash.clonedeep@~4.5.0" = s."lodash.clonedeep@4.5.0";
        "lodash.escaperegexp@4.1.2" = f "lodash.escaperegexp" "4.1.2" y "64762c48618082518ac3df4ccf5d5886dae20347" [];
        "lodash.escaperegexp@^4.1.2" = s."lodash.escaperegexp@4.1.2";
        "lodash.ismatch@4.4.0" = f "lodash.ismatch" "4.4.0" y "756cb5150ca3ba6f11085a78849645f188f85f37" [];
        "lodash.ismatch@^4.4.0" = s."lodash.ismatch@4.4.0";
        "lodash.isplainobject@4.0.6" = f "lodash.isplainobject" "4.0.6" y "7c526a52d89b45c45cc690b88163be0497f550cb" [];
        "lodash.isplainobject@^4.0.6" = s."lodash.isplainobject@4.0.6";
        "lodash.isstring@4.0.1" = f "lodash.isstring" "4.0.1" y "d527dfb5456eca7cc9bb95d5daeaf88ba54a5451" [];
        "lodash.isstring@^4.0.1" = s."lodash.isstring@4.0.1";
        "lodash.restparam@*" = s."lodash.restparam@3.6.1";
        "lodash.restparam@3.6.1" = f "lodash.restparam" "3.6.1" y "936a4e309ef330a7645ed4145986c85ae5b20805" [];
        "lodash.toarray@4.4.0" = f "lodash.toarray" "4.4.0" y "24c4bfcd6b2fba38bfd0594db1179d8e9b656561" [];
        "lodash.toarray@^4.4.0" = s."lodash.toarray@4.4.0";
        "lodash.union@4.6.0" = f "lodash.union" "4.6.0" y "48bb5088409f16f1821666641c44dd1aaae3cd88" [];
        "lodash.union@~4.6.0" = s."lodash.union@4.6.0";
        "lodash.uniq@4.5.0" = f "lodash.uniq" "4.5.0" y "d0225373aeb652adc1bc82e4945339a842754773" [];
        "lodash.uniq@~4.5.0" = s."lodash.uniq@4.5.0";
        "lodash.uniqby@4.7.0" = f "lodash.uniqby" "4.7.0" y "d99c07a669e9e6d24e1362dfe266c67616af1302" [];
        "lodash.uniqby@^4.7.0" = s."lodash.uniqby@4.7.0";
        "lodash.without@4.4.0" = f "lodash.without" "4.4.0" y "3cd4574a00b67bae373a94b748772640507b7aac" [];
        "lodash.without@~4.4.0" = s."lodash.without@4.4.0";
        "lodash@4.17.20" = f "lodash" "4.17.20" y "b44a9b6297bcb698f1c51a3545a2b3b368d59c52" [];
        "lodash@^4.17.11" = s."lodash@4.17.20";
        "lodash@^4.17.15" = s."lodash@4.17.20";
        "lodash@^4.17.4" = s."lodash@4.17.20";
        "looper@2.0.0" = f "looper" "2.0.0" y "66cd0c774af3d4fedac53794f742db56da8f09ec" [];
        "looper@3.0.0" = f "looper" "3.0.0" y "2efa54c3b1cbaba9b94aee2e5914b0be57fbb749" [];
        "looper@^2.0.0" = s."looper@2.0.0";
        "looper@^3.0.0" = s."looper@3.0.0";
        "loose-envify@1.4.0" = f "loose-envify" "1.4.0" y "71ee51fa7be4caec1a63839f7e682d8132d30caf" [
          (s."js-tokens@^3.0.0 || ^4.0.0")
          ];
        "loose-envify@^1.0.0" = s."loose-envify@1.4.0";
        "lowercase-keys@1.0.1" = f "lowercase-keys" "1.0.1" y "6f9e30b47084d971a7c820ff15a6c5167b74c26f" [];
        "lowercase-keys@2.0.0" = f "lowercase-keys" "2.0.0" y "2603e78b7b4b0006cbca2fbcc8a3202558ac9479" [];
        "lowercase-keys@^1.0.0" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^1.0.1" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^2.0.0" = s."lowercase-keys@2.0.0";
        "lru-cache@3.2.0" = f "lru-cache" "3.2.0" y "71789b3b7f5399bec8565dda38aa30d2a097efee" [
          (s."pseudomap@^1.0.1")
          ];
        "lru-cache@4.1.5" = f "lru-cache" "4.1.5" y "8bbe50ea85bed59bc9e33dcab8235ee9bcf443cd" [
          (s."pseudomap@^1.0.2")
          (s."yallist@^2.1.2")
          ];
        "lru-cache@5.1.1" = f "lru-cache" "5.1.1" y "1da27e6710271947695daf6848e847f01d84b920" [
          (s."yallist@^3.0.2")
          ];
        "lru-cache@6.0.0" = f "lru-cache" "6.0.0" y "6d6fe6570ebd96aaf90fcad1dafa3b2566db3a94" [
          (s."yallist@^4.0.0")
          ];
        "lru-cache@^3.2.0" = s."lru-cache@3.2.0";
        "lru-cache@^4.0.1" = s."lru-cache@4.1.5";
        "lru-cache@^5.1.1" = s."lru-cache@5.1.1";
        "lru-cache@^6.0.0" = s."lru-cache@6.0.0";
        "ltgt@2.1.3" = f "ltgt" "2.1.3" y "10851a06d9964b971178441c23c9e52698eece34" [];
        "ltgt@2.2.1" = f "ltgt" "2.2.1" y "f35ca91c493f7b73da0e07495304f17b31f87ee5" [];
        "ltgt@^2.1.2" = s."ltgt@2.1.3";
        "ltgt@~2.1.1" = s."ltgt@2.1.3";
        "ltgt@~2.2.0" = s."ltgt@2.2.1";
        "macos-release@2.4.1" = f "macos-release" "2.4.1" y "64033d0ec6a5e6375155a74b1a1eba8e509820ac" [];
        "macos-release@^2.2.0" = s."macos-release@2.4.1";
        "make-dir@1.3.0" = f "make-dir" "1.3.0" y "79c1033b80515bd6d24ec9933e860ca75ee27f0c" [
          (s."pify@^3.0.0")
          ];
        "make-dir@2.1.0" = f "make-dir" "2.1.0" y "5f0310e18b8be898cc07009295a30ae41e91e6f5" [
          (s."pify@^4.0.1")
          (s."semver@^5.6.0")
          ];
        "make-dir@^1.0.0" = s."make-dir@1.3.0";
        "make-dir@^2.0.0" = s."make-dir@2.1.0";
        "make-fetch-happen@5.0.2" = f "make-fetch-happen" "5.0.2" y "aa8387104f2687edca01c8687ee45013d02d19bd" [
          (s."agentkeepalive@^3.4.1")
          (s."cacache@^12.0.0")
          (s."http-cache-semantics@^3.8.1")
          (s."http-proxy-agent@^2.1.0")
          (s."https-proxy-agent@^2.2.3")
          (s."lru-cache@^5.1.1")
          (s."mississippi@^3.0.0")
          (s."node-fetch-npm@^2.0.2")
          (s."promise-retry@^1.1.1")
          (s."socks-proxy-agent@^4.0.0")
          (s."ssri@^6.0.0")
          ];
        "make-fetch-happen@^5.0.0" = s."make-fetch-happen@5.0.2";
        "map-age-cleaner@0.1.3" = f "map-age-cleaner" "0.1.3" y "7d583a7306434c055fe474b0f45078e6e1b4b92a" [
          (s."p-defer@^1.0.0")
          ];
        "map-age-cleaner@^0.1.1" = s."map-age-cleaner@0.1.3";
        "map-cache@0.2.2" = f "map-cache" "0.2.2" y "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf" [];
        "map-cache@^0.2.2" = s."map-cache@0.2.2";
        "map-obj@1.0.1" = f "map-obj" "1.0.1" y "d933ceb9205d82bdcf4886f6742bdc2b4dea146d" [];
        "map-obj@4.1.0" = f "map-obj" "4.1.0" y "b91221b542734b9f14256c0132c897c5d7256fd5" [];
        "map-obj@^1.0.0" = s."map-obj@1.0.1";
        "map-obj@^4.0.0" = s."map-obj@4.1.0";
        "map-visit@1.0.0" = f "map-visit" "1.0.0" y "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f" [
          (s."object-visit@^1.0.0")
          ];
        "map-visit@^1.0.0" = s."map-visit@1.0.0";
        "marked-terminal@4.1.0" = f "marked-terminal" "4.1.0" y "01087372d3636dc7cb286475a1d6147187f500e0" [
          (s."ansi-escapes@^4.3.1")
          (s."cardinal@^2.1.1")
          (s."chalk@^4.0.0")
          (s."cli-table@^0.3.1")
          (s."node-emoji@^1.10.0")
          (s."supports-hyperlinks@^2.1.0")
          ];
        "marked-terminal@^4.0.0" = s."marked-terminal@4.1.0";
        "marked@1.2.0" = f "marked" "1.2.0" y "7221ce2395fa6cf6d722e6f2871a32d3513c85ca" [];
        "marked@^1.0.0" = s."marked@1.2.0";
        "md5.js@1.3.5" = f "md5.js" "1.3.5" y "b5d07b8e3216e3e27cd728d72f70d1e6a342005f" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "md5.js@^1.3.4" = s."md5.js@1.3.5";
        "meant@1.0.2" = f "meant" "1.0.2" y "5d0c78310a3d8ae1408a16be0fe0bd42a969f560" [];
        "meant@^1.0.2" = s."meant@1.0.2";
        "media-typer@0.3.0" = f "media-typer" "0.3.0" y "8710d7af0aa626f8fffa1ce00168545263255748" [];
        "mem@4.3.0" = f "mem" "4.3.0" y "461af497bc4ae09608cdb2e60eefb69bff744178" [
          (s."map-age-cleaner@^0.1.1")
          (s."mimic-fn@^2.0.0")
          (s."p-is-promise@^2.0.0")
          ];
        "mem@^4.0.0" = s."mem@4.3.0";
        "memdown@1.4.1" = f "memdown" "1.4.1" y "b4e4e192174664ffbae41361aa500f3119efe215" [
          (s."abstract-leveldown@~2.7.1")
          (s."functional-red-black-tree@^1.0.1")
          (s."immediate@^3.2.3")
          (s."inherits@~2.0.1")
          (s."ltgt@~2.2.0")
          (s."safe-buffer@~5.1.1")
          ];
        "memdown@3.0.0" = f "memdown" "3.0.0" y "93aca055d743b20efc37492e9e399784f2958309" [
          (s."abstract-leveldown@~5.0.0")
          (s."functional-red-black-tree@~1.0.1")
          (s."immediate@~3.2.3")
          (s."inherits@~2.0.1")
          (s."ltgt@~2.2.0")
          (s."safe-buffer@~5.1.1")
          ];
        "memdown@^1.0.0" = s."memdown@1.4.1";
        "memdown@~3.0.0" = s."memdown@3.0.0";
        "memory-fs@0.4.1" = f "memory-fs" "0.4.1" y "3a9a20b8462523e447cfbc7e8bb80ed667bfc552" [
          (s."errno@^0.1.3")
          (s."readable-stream@^2.0.1")
          ];
        "memory-fs@0.5.0" = f "memory-fs" "0.5.0" y "324c01288b88652966d161db77838720845a8e3c" [
          (s."errno@^0.1.3")
          (s."readable-stream@^2.0.1")
          ];
        "memory-fs@^0.4.1" = s."memory-fs@0.4.1";
        "memory-fs@^0.5.0" = s."memory-fs@0.5.0";
        "meow@7.1.1" = f "meow" "7.1.1" y "7c01595e3d337fcb0ec4e8eed1666ea95903d306" [
          (s."@types/minimist@^1.2.0")
          (s."camelcase-keys@^6.2.2")
          (s."decamelize-keys@^1.1.0")
          (s."hard-rejection@^2.1.0")
          (s."minimist-options@4.1.0")
          (s."normalize-package-data@^2.5.0")
          (s."read-pkg-up@^7.0.1")
          (s."redent@^3.0.0")
          (s."trim-newlines@^3.0.0")
          (s."type-fest@^0.13.1")
          (s."yargs-parser@^18.1.3")
          ];
        "meow@^7.0.0" = s."meow@7.1.1";
        "merge-descriptors@1.0.1" = f "merge-descriptors" "1.0.1" y "b00aaa556dd8b44568150ec9d1b953f3f90cbb61" [];
        "merge-stream@2.0.0" = f "merge-stream" "2.0.0" y "52823629a14dd00c9770fb6ad47dc6310f2c1f60" [];
        "merge-stream@^2.0.0" = s."merge-stream@2.0.0";
        "merge2@1.4.1" = f "merge2" "1.4.1" y "4368892f885e907455a6fd7dc55c0c9d404990ae" [];
        "merge2@^1.3.0" = s."merge2@1.4.1";
        "merkle-patricia-tree@2.3.2" = f "merkle-patricia-tree" "2.3.2" y "982ca1b5a0fde00eed2f6aeed1f9152860b8208a" [
          (s."async@^1.4.2")
          (s."ethereumjs-util@^5.0.0")
          (s."level-ws@0.0.0")
          (s."levelup@^1.2.1")
          (s."memdown@^1.0.0")
          (s."readable-stream@^2.0.0")
          (s."rlp@^2.0.0")
          (s."semaphore@>=1.0.1")
          ];
        "merkle-patricia-tree@3.0.0" = f "merkle-patricia-tree" "3.0.0" y "448d85415565df72febc33ca362b8b614f5a58f8" [
          (s."async@^2.6.1")
          (s."ethereumjs-util@^5.2.0")
          (s."level-mem@^3.0.1")
          (s."level-ws@^1.0.0")
          (s."readable-stream@^3.0.6")
          (s."rlp@^2.0.0")
          (s."semaphore@>=1.0.1")
          ];
        "merkle-patricia-tree@^2.1.2" = s."merkle-patricia-tree@2.3.2";
        "merkle-patricia-tree@^2.3.2" = s."merkle-patricia-tree@2.3.2";
        "methods@1.1.2" = f "methods" "1.1.2" y "5529a4d67654134edcc5266656835b0f851afcee" [];
        "methods@~1.1.2" = s."methods@1.1.2";
        "micromatch@3.1.10" = f "micromatch" "3.1.10" y "70859bc95c9840952f359a068a3fc49f9ecfac23" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."braces@^2.3.1")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."extglob@^2.0.4")
          (s."fragment-cache@^0.2.1")
          (s."kind-of@^6.0.2")
          (s."nanomatch@^1.2.9")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.2")
          ];
        "micromatch@4.0.2" = f "micromatch" "4.0.2" y "4fcb0999bf9fbc2fcbdd212f6d629b9a56c39259" [
          (s."braces@^3.0.1")
          (s."picomatch@^2.0.5")
          ];
        "micromatch@^3.0.4" = s."micromatch@3.1.10";
        "micromatch@^3.1.10" = s."micromatch@3.1.10";
        "micromatch@^3.1.4" = s."micromatch@3.1.10";
        "micromatch@^4.0.0" = s."micromatch@4.0.2";
        "micromatch@^4.0.2" = s."micromatch@4.0.2";
        "miller-rabin@4.0.1" = f "miller-rabin" "4.0.1" y "f080351c865b0dc562a8462966daa53543c78a4d" [
          (s."bn.js@^4.0.0")
          (s."brorand@^1.0.1")
          ];
        "miller-rabin@^4.0.0" = s."miller-rabin@4.0.1";
        "mime-db@1.35.0" = f "mime-db" "1.35.0" y "0569d657466491283709663ad379a99b90d9ab47" [];
        "mime-db@1.44.0" = f "mime-db" "1.44.0" y "fa11c5eb0aca1334b4233cb4d52f10c5a6272f92" [];
        "mime-db@~1.35.0" = s."mime-db@1.35.0";
        "mime-types@2.1.19" = f "mime-types" "2.1.19" y "71e464537a7ef81c15f2db9d97e913fc0ff606f0" [
          (s."mime-db@~1.35.0")
          ];
        "mime-types@2.1.27" = f "mime-types" "2.1.27" y "47949f98e279ea53119f5722e0f34e529bec009f" [
          (s."mime-db@1.44.0")
          ];
        "mime-types@^2.1.12" = s."mime-types@2.1.27";
        "mime-types@^2.1.16" = s."mime-types@2.1.27";
        "mime-types@~2.1.19" = s."mime-types@2.1.19";
        "mime-types@~2.1.24" = s."mime-types@2.1.27";
        "mime@1.6.0" = f "mime" "1.6.0" y "32cd9e5c64553bd58d19a568af452acff04981b1" [];
        "mime@2.4.6" = f "mime" "2.4.6" y "e5b407c90db442f2beb5b162373d07b69affa4d1" [];
        "mime@^2.4.3" = s."mime@2.4.6";
        "mimic-fn@2.1.0" = f "mimic-fn" "2.1.0" y "7ed2c2ccccaf84d3ffcb7a69b57711fc2083401b" [];
        "mimic-fn@^2.0.0" = s."mimic-fn@2.1.0";
        "mimic-fn@^2.1.0" = s."mimic-fn@2.1.0";
        "mimic-response@1.0.1" = f "mimic-response" "1.0.1" y "4923538878eef42063cb8a3e3b0798781487ab1b" [];
        "mimic-response@^1.0.0" = s."mimic-response@1.0.1";
        "mimic-response@^1.0.1" = s."mimic-response@1.0.1";
        "min-document@2.19.0" = f "min-document" "2.19.0" y "7bd282e3f5842ed295bb748cdd9f1ffa2c824685" [
          (s."dom-walk@^0.1.0")
          ];
        "min-document@^2.19.0" = s."min-document@2.19.0";
        "min-indent@1.0.1" = f "min-indent" "1.0.1" y "a63f681673b30571fbe8bc25686ae746eefa9869" [];
        "min-indent@^1.0.0" = s."min-indent@1.0.1";
        "minimalistic-assert@1.0.1" = f "minimalistic-assert" "1.0.1" y "2e194de044626d4a10e7f7fbc00ce73e83e4d5c7" [];
        "minimalistic-assert@^1.0.0" = s."minimalistic-assert@1.0.1";
        "minimalistic-assert@^1.0.1" = s."minimalistic-assert@1.0.1";
        "minimalistic-crypto-utils@1.0.1" = f "minimalistic-crypto-utils" "1.0.1" y "f6c00c1c0b082246e5c4d99dfb8c7c083b2b582a" [];
        "minimalistic-crypto-utils@^1.0.0" = s."minimalistic-crypto-utils@1.0.1";
        "minimalistic-crypto-utils@^1.0.1" = s."minimalistic-crypto-utils@1.0.1";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@^3.0.4" = s."minimatch@3.0.4";
        "minimist-options@4.1.0" = f "minimist-options" "4.1.0" y "c0655713c53a8a2ebd77ffa247d342c40f010619" [
          (s."arrify@^1.0.1")
          (s."is-plain-obj@^1.1.0")
          (s."kind-of@^6.0.3")
          ];
        "minimist@1.2.5" = f "minimist" "1.2.5" y "67d66014b66a6a8aaa0c083c5fd58df4e4e97602" [];
        "minimist@^1.2.0" = s."minimist@1.2.5";
        "minimist@^1.2.5" = s."minimist@1.2.5";
        "minimist@~1.2.5" = s."minimist@1.2.5";
        "minipass@2.9.0" = f "minipass" "2.9.0" y "e713762e7d3e32fed803115cf93e04bca9fcc9a6" [
          (s."safe-buffer@^5.1.2")
          (s."yallist@^3.0.0")
          ];
        "minipass@^2.3.5" = s."minipass@2.9.0";
        "minipass@^2.6.0" = s."minipass@2.9.0";
        "minipass@^2.8.6" = s."minipass@2.9.0";
        "minipass@^2.9.0" = s."minipass@2.9.0";
        "minizlib@1.3.3" = f "minizlib" "1.3.3" y "2290de96818a34c29551c8a8d301216bd65a861d" [
          (s."minipass@^2.9.0")
          ];
        "minizlib@^1.2.1" = s."minizlib@1.3.3";
        "mississippi@3.0.0" = f "mississippi" "3.0.0" y "ea0a3291f97e0b5e8776b363d5f0a12d94c67022" [
          (s."concat-stream@^1.5.0")
          (s."duplexify@^3.4.2")
          (s."end-of-stream@^1.1.0")
          (s."flush-write-stream@^1.0.0")
          (s."from2@^2.1.0")
          (s."parallel-transform@^1.1.0")
          (s."pump@^3.0.0")
          (s."pumpify@^1.3.3")
          (s."stream-each@^1.1.0")
          (s."through2@^2.0.0")
          ];
        "mississippi@^3.0.0" = s."mississippi@3.0.0";
        "mixin-deep@1.3.2" = f "mixin-deep" "1.3.2" y "1120b43dc359a785dce65b55b82e257ccf479566" [
          (s."for-in@^1.0.2")
          (s."is-extendable@^1.0.1")
          ];
        "mixin-deep@^1.2.0" = s."mixin-deep@1.3.2";
        "mkdirp-promise@5.0.1" = f "mkdirp-promise" "5.0.1" y "e9b8f68e552c68a9c1713b84883f7a1dd039b8a1" [
          (s."mkdirp@*")
          ];
        "mkdirp-promise@^5.0.1" = s."mkdirp-promise@5.0.1";
        "mkdirp@*" = s."mkdirp@0.5.5";
        "mkdirp@0.5.5" = f "mkdirp" "0.5.5" y "d91cefd62d1436ca0f41620e251288d420099def" [
          (s."minimist@^1.2.5")
          ];
        "mkdirp@^0.5.0" = s."mkdirp@0.5.5";
        "mkdirp@^0.5.1" = s."mkdirp@0.5.5";
        "mkdirp@^0.5.3" = s."mkdirp@0.5.5";
        "mkdirp@^0.5.5" = s."mkdirp@0.5.5";
        "mkdirp@~0.5.0" = s."mkdirp@0.5.5";
        "mock-fs@4.13.0" = f "mock-fs" "4.13.0" y "31c02263673ec3789f90eb7b6963676aa407a598" [];
        "mock-fs@^4.1.0" = s."mock-fs@4.13.0";
        "modify-values@1.0.1" = f "modify-values" "1.0.1" y "b3939fa605546474e3e3e3c63d64bd43b4ee6022" [];
        "modify-values@^1.0.0" = s."modify-values@1.0.1";
        "move-concurrently@1.0.1" = f "move-concurrently" "1.0.1" y "be2c005fda32e0b29af1f05d7c4b33214c701f92" [
          (s."aproba@^1.1.1")
          (s."copy-concurrently@^1.0.0")
          (s."fs-write-stream-atomic@^1.0.8")
          (s."mkdirp@^0.5.1")
          (s."rimraf@^2.5.4")
          (s."run-queue@^1.0.3")
          ];
        "move-concurrently@^1.0.1" = s."move-concurrently@1.0.1";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "ms@2.1.1" = f "ms" "2.1.1" y "30a5864eb3ebb0a66f2ebe6d727af06a09d86e0a" [];
        "ms@2.1.2" = f "ms" "2.1.2" y "d09d1f357b443f493382a8eb3ccd183872ae6009" [];
        "ms@^2.0.0" = s."ms@2.1.1";
        "ms@^2.1.1" = s."ms@2.1.2";
        "multibase@0.6.1" = f "multibase" "0.6.1" y "b76df6298536cc17b9f6a6db53ec88f85f8cc12b" [
          (s."base-x@^3.0.8")
          (s."buffer@^5.5.0")
          ];
        "multibase@0.7.0" = f "multibase" "0.7.0" y "1adfc1c50abe05eefeb5091ac0c2728d6b84581b" [
          (s."base-x@^3.0.8")
          (s."buffer@^5.5.0")
          ];
        "multibase@^0.7.0" = s."multibase@0.7.0";
        "multibase@~0.6.0" = s."multibase@0.6.1";
        "multicodec@0.5.7" = f "multicodec" "0.5.7" y "1fb3f9dd866a10a55d226e194abba2dcc1ee9ffd" [
          (s."varint@^5.0.0")
          ];
        "multicodec@1.0.4" = f "multicodec" "1.0.4" y "46ac064657c40380c28367c90304d8ed175a714f" [
          (s."buffer@^5.6.0")
          (s."varint@^5.0.0")
          ];
        "multicodec@^0.5.5" = s."multicodec@0.5.7";
        "multicodec@^1.0.0" = s."multicodec@1.0.4";
        "multihashes@0.4.21" = f "multihashes" "0.4.21" y "dc02d525579f334a7909ade8a122dabb58ccfcb5" [
          (s."buffer@^5.5.0")
          (s."multibase@^0.7.0")
          (s."varint@^5.0.0")
          ];
        "multihashes@^0.4.15" = s."multihashes@0.4.21";
        "multihashes@~0.4.15" = s."multihashes@0.4.21";
        "mute-stream@0.0.7" = f "mute-stream" "0.0.7" y "3075ce93bc21b8fab43e1bc4da7e8115ed1e7bab" [];
        "mute-stream@~0.0.4" = s."mute-stream@0.0.7";
        "nan@2.14.1" = f "nan" "2.14.1" y "d7be34dfa3105b91494c3147089315eff8874b01" [];
        "nan@^2.12.1" = s."nan@2.14.1";
        "nano-json-stream-parser@0.1.2" = f "nano-json-stream-parser" "0.1.2" y "0cc8f6d0e2b622b479c40d499c46d64b755c6f5f" [];
        "nano-json-stream-parser@^0.1.2" = s."nano-json-stream-parser@0.1.2";
        "nanomatch@1.2.13" = f "nanomatch" "1.2.13" y "b87a8aa4fc0de8fe6be88895b38983ff265bd119" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."fragment-cache@^0.2.1")
          (s."is-windows@^1.0.2")
          (s."kind-of@^6.0.2")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "nanomatch@^1.2.9" = s."nanomatch@1.2.13";
        "negotiator@0.6.2" = f "negotiator" "0.6.2" y "feacf7ccf525a77ae9634436a64883ffeca346fb" [];
        "neo-async@2.6.2" = f "neo-async" "2.6.2" y "b4aafb93e3aeb2d8174ca53cf163ab7d7308305f" [];
        "neo-async@^2.5.0" = s."neo-async@2.6.2";
        "neo-async@^2.6.0" = s."neo-async@2.6.2";
        "neo-async@^2.6.1" = s."neo-async@2.6.2";
        "nerf-dart@1.0.0" = f "nerf-dart" "1.0.0" y "e6dab7febf5ad816ea81cf5c629c5a0ebde72c1a" [];
        "nerf-dart@^1.0.0" = s."nerf-dart@1.0.0";
        "next-tick@1.0.0" = f "next-tick" "1.0.0" y "ca86d1fe8828169b0120208e3dc8424b9db8342c" [];
        "next-tick@~1.0.0" = s."next-tick@1.0.0";
        "nice-try@1.0.5" = f "nice-try" "1.0.5" y "a3378a7696ce7d223e88fc9b764bd7ef1089e366" [];
        "nice-try@^1.0.4" = s."nice-try@1.0.5";
        "node-addon-api@2.0.2" = f "node-addon-api" "2.0.2" y "432cfa82962ce494b132e9d72a15b29f71ff5d32" [];
        "node-addon-api@^2.0.0" = s."node-addon-api@2.0.2";
        "node-emoji@1.10.0" = f "node-emoji" "1.10.0" y "8886abd25d9c7bb61802a658523d1f8d2a89b2da" [
          (s."lodash.toarray@^4.4.0")
          ];
        "node-emoji@^1.10.0" = s."node-emoji@1.10.0";
        "node-fetch-npm@2.0.2" = f "node-fetch-npm" "2.0.2" y "7258c9046182dca345b4208eda918daf33697ff7" [
          (s."encoding@^0.1.11")
          (s."json-parse-better-errors@^1.0.0")
          (s."safe-buffer@^5.1.1")
          ];
        "node-fetch-npm@^2.0.2" = s."node-fetch-npm@2.0.2";
        "node-fetch@1.7.3" = f "node-fetch" "1.7.3" y "980f6f72d85211a5347c6b2bc18c5b84c3eb47ef" [
          (s."encoding@^0.1.11")
          (s."is-stream@^1.0.1")
          ];
        "node-fetch@2.1.2" = f "node-fetch" "2.1.2" y "ab884e8e7e57e38a944753cec706f788d1768bb5" [];
        "node-fetch@2.6.1" = f "node-fetch" "2.6.1" y "045bd323631f76ed2e2b55573394416b639a0052" [];
        "node-fetch@^2.6.1" = s."node-fetch@2.6.1";
        "node-fetch@~1.7.1" = s."node-fetch@1.7.3";
        "node-gyp-build@3.7.0" = f "node-gyp-build" "3.7.0" y "daa77a4f547b9aed3e2aac779eaf151afd60ec8d" [];
        "node-gyp-build@4.2.3" = f "node-gyp-build" "4.2.3" y "ce6277f853835f718829efb47db20f3e4d9c4739" [];
        "node-gyp-build@^4.2.0" = s."node-gyp-build@4.2.3";
        "node-gyp-build@~3.7.0" = s."node-gyp-build@3.7.0";
        "node-gyp@5.1.0" = f "node-gyp" "5.1.0" y "8e31260a7af4a2e2f994b0673d4e0b3866156332" [
          (s."env-paths@^2.2.0")
          (s."glob@^7.1.4")
          (s."graceful-fs@^4.2.2")
          (s."mkdirp@^0.5.1")
          (s."nopt@^4.0.1")
          (s."npmlog@^4.1.2")
          (s."request@^2.88.0")
          (s."rimraf@^2.6.3")
          (s."semver@^5.7.1")
          (s."tar@^4.4.12")
          (s."which@^1.3.1")
          ];
        "node-gyp@^5.0.2" = s."node-gyp@5.1.0";
        "node-gyp@^5.1.0" = s."node-gyp@5.1.0";
        "node-libs-browser@2.2.1" = f "node-libs-browser" "2.2.1" y "b64f513d18338625f90346d27b0d235e631f6425" [
          (s."assert@^1.1.1")
          (s."browserify-zlib@^0.2.0")
          (s."buffer@^4.3.0")
          (s."console-browserify@^1.1.0")
          (s."constants-browserify@^1.0.0")
          (s."crypto-browserify@^3.11.0")
          (s."domain-browser@^1.1.1")
          (s."events@^3.0.0")
          (s."https-browserify@^1.0.0")
          (s."os-browserify@^0.3.0")
          (s."path-browserify@0.0.1")
          (s."process@^0.11.10")
          (s."punycode@^1.2.4")
          (s."querystring-es3@^0.2.0")
          (s."readable-stream@^2.3.3")
          (s."stream-browserify@^2.0.1")
          (s."stream-http@^2.7.2")
          (s."string_decoder@^1.0.0")
          (s."timers-browserify@^2.0.4")
          (s."tty-browserify@0.0.0")
          (s."url@^0.11.0")
          (s."util@^0.11.0")
          (s."vm-browserify@^1.0.1")
          ];
        "node-libs-browser@^2.2.1" = s."node-libs-browser@2.2.1";
        "node-loader@0.6.0" = f "node-loader" "0.6.0" y "c797ef51095ed5859902b157f6384f6361e05ae8" [];
        "node-loader@^0.6.0" = s."node-loader@0.6.0";
        "nopt@4.0.3" = f "nopt" "4.0.3" y "a375cad9d02fd921278d954c2254d5aa57e15e48" [
          (s."abbrev@1")
          (s."osenv@^0.1.4")
          ];
        "nopt@^4.0.1" = s."nopt@4.0.3";
        "nopt@^4.0.3" = s."nopt@4.0.3";
        "normalize-package-data@2.5.0" = f "normalize-package-data" "2.5.0" y "e66db1838b200c1dfc233225d12cb36520e234a8" [
          (s."hosted-git-info@^2.1.4")
          (s."resolve@^1.10.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
          ];
        "normalize-package-data@^2.0.0" = s."normalize-package-data@2.5.0";
        "normalize-package-data@^2.4.0" = s."normalize-package-data@2.5.0";
        "normalize-package-data@^2.5.0" = s."normalize-package-data@2.5.0";
        "normalize-path@2.1.1" = f "normalize-path" "2.1.1" y "1ab28b556e198363a8c1a6f7e6fa20137fe6aed9" [
          (s."remove-trailing-separator@^1.0.1")
          ];
        "normalize-path@3.0.0" = f "normalize-path" "3.0.0" y "0dcd69ff23a1c9b11fd0978316644a0388216a65" [];
        "normalize-path@^2.1.1" = s."normalize-path@2.1.1";
        "normalize-path@^3.0.0" = s."normalize-path@3.0.0";
        "normalize-path@~3.0.0" = s."normalize-path@3.0.0";
        "normalize-url@4.5.0" = f "normalize-url" "4.5.0" y "453354087e6ca96957bd8f5baf753f5982142129" [];
        "normalize-url@5.2.0" = f "normalize-url" "5.2.0" y "a7e3e6cd90965e262500cc8a417de7bcb0c7f5af" [];
        "normalize-url@^4.1.0" = s."normalize-url@4.5.0";
        "normalize-url@^5.0.0" = s."normalize-url@5.2.0";
        "notp@2.0.3" = f "notp" "2.0.3" y "a9fd11e25cfe1ccb39fc6689544ee4c10ef9a577" [];
        "npm-audit-report@1.3.3" = f "npm-audit-report" "1.3.3" y "8226deeb253b55176ed147592a3995442f2179ed" [
          (s."cli-table3@^0.5.0")
          (s."console-control-strings@^1.1.0")
          ];
        "npm-audit-report@^1.3.3" = s."npm-audit-report@1.3.3";
        "npm-bundled@1.1.1" = f "npm-bundled" "1.1.1" y "1edd570865a94cdb1bc8220775e29466c9fb234b" [
          (s."npm-normalize-package-bin@^1.0.1")
          ];
        "npm-bundled@^1.0.1" = s."npm-bundled@1.1.1";
        "npm-cache-filename@1.0.2" = f "npm-cache-filename" "1.0.2" y "ded306c5b0bfc870a9e9faf823bc5f283e05ae11" [];
        "npm-cache-filename@~1.0.2" = s."npm-cache-filename@1.0.2";
        "npm-install-checks@3.0.2" = f "npm-install-checks" "3.0.2" y "ab2e32ad27baa46720706908e5b14c1852de44d9" [
          (s."semver@^2.3.0 || 3.x || 4 || 5")
          ];
        "npm-install-checks@^3.0.2" = s."npm-install-checks@3.0.2";
        "npm-lifecycle@3.1.5" = f "npm-lifecycle" "3.1.5" y "9882d3642b8c82c815782a12e6a1bfeed0026309" [
          (s."byline@^5.0.0")
          (s."graceful-fs@^4.1.15")
          (s."node-gyp@^5.0.2")
          (s."resolve-from@^4.0.0")
          (s."slide@^1.1.6")
          (s."uid-number@0.0.6")
          (s."umask@^1.1.0")
          (s."which@^1.3.1")
          ];
        "npm-lifecycle@^3.0.0" = s."npm-lifecycle@3.1.5";
        "npm-lifecycle@^3.1.5" = s."npm-lifecycle@3.1.5";
        "npm-logical-tree@1.2.1" = f "npm-logical-tree" "1.2.1" y "44610141ca24664cad35d1e607176193fd8f5b88" [];
        "npm-logical-tree@^1.2.1" = s."npm-logical-tree@1.2.1";
        "npm-normalize-package-bin@1.0.1" = f "npm-normalize-package-bin" "1.0.1" y "6e79a41f23fd235c0623218228da7d9c23b8f6e2" [];
        "npm-normalize-package-bin@^1.0.0" = s."npm-normalize-package-bin@1.0.1";
        "npm-normalize-package-bin@^1.0.1" = s."npm-normalize-package-bin@1.0.1";
        "npm-package-arg@6.1.1" = f "npm-package-arg" "6.1.1" y "02168cb0a49a2b75bf988a28698de7b529df5cb7" [
          (s."hosted-git-info@^2.7.1")
          (s."osenv@^0.1.5")
          (s."semver@^5.6.0")
          (s."validate-npm-package-name@^3.0.0")
          ];
        "npm-package-arg@^4.0.0 || ^5.0.0 || ^6.0.0" = s."npm-package-arg@6.1.1";
        "npm-package-arg@^6.0.0" = s."npm-package-arg@6.1.1";
        "npm-package-arg@^6.1.0" = s."npm-package-arg@6.1.1";
        "npm-package-arg@^6.1.1" = s."npm-package-arg@6.1.1";
        "npm-packlist@1.4.8" = f "npm-packlist" "1.4.8" y "56ee6cc135b9f98ad3d51c1c95da22bbb9b2ef3e" [
          (s."ignore-walk@^3.0.1")
          (s."npm-bundled@^1.0.1")
          (s."npm-normalize-package-bin@^1.0.1")
          ];
        "npm-packlist@^1.1.12" = s."npm-packlist@1.4.8";
        "npm-packlist@^1.4.8" = s."npm-packlist@1.4.8";
        "npm-pick-manifest@3.0.2" = f "npm-pick-manifest" "3.0.2" y "f4d9e5fd4be2153e5f4e5f9b7be8dc419a99abb7" [
          (s."figgy-pudding@^3.5.1")
          (s."npm-package-arg@^6.0.0")
          (s."semver@^5.4.1")
          ];
        "npm-pick-manifest@^3.0.0" = s."npm-pick-manifest@3.0.2";
        "npm-pick-manifest@^3.0.2" = s."npm-pick-manifest@3.0.2";
        "npm-profile@4.0.4" = f "npm-profile" "4.0.4" y "28ee94390e936df6d084263ee2061336a6a1581b" [
          (s."aproba@^1.1.2 || 2")
          (s."figgy-pudding@^3.4.1")
          (s."npm-registry-fetch@^4.0.0")
          ];
        "npm-profile@^4.0.2" = s."npm-profile@4.0.4";
        "npm-profile@^4.0.4" = s."npm-profile@4.0.4";
        "npm-registry-fetch@4.0.7" = f "npm-registry-fetch" "4.0.7" y "57951bf6541e0246b34c9f9a38ab73607c9449d7" [
          (s."JSONStream@^1.3.4")
          (s."bluebird@^3.5.1")
          (s."figgy-pudding@^3.4.1")
          (s."lru-cache@^5.1.1")
          (s."make-fetch-happen@^5.0.0")
          (s."npm-package-arg@^6.1.0")
          (s."safe-buffer@^5.2.0")
          ];
        "npm-registry-fetch@^4.0.0" = s."npm-registry-fetch@4.0.7";
        "npm-registry-fetch@^4.0.7" = s."npm-registry-fetch@4.0.7";
        "npm-run-path@2.0.2" = f "npm-run-path" "2.0.2" y "35a9232dfa35d7067b4cb2ddf2357b1871536c5f" [
          (s."path-key@^2.0.0")
          ];
        "npm-run-path@4.0.1" = f "npm-run-path" "4.0.1" y "b7ecd1e5ed53da8e37a55e1c2269e0b97ed748ea" [
          (s."path-key@^3.0.0")
          ];
        "npm-run-path@^2.0.0" = s."npm-run-path@2.0.2";
        "npm-run-path@^4.0.0" = s."npm-run-path@4.0.1";
        "npm-user-validate@1.0.0" = f "npm-user-validate" "1.0.0" y "8ceca0f5cea04d4e93519ef72d0557a75122e951" [];
        "npm-user-validate@~1.0.0" = s."npm-user-validate@1.0.0";
        "npm@6.14.8" = f "npm" "6.14.8" y "64ef754345639bc035982ec3f609353c8539033c" [
          (s."JSONStream@^1.3.5")
          (s."abbrev@~1.1.1")
          (s."ansicolors@~0.3.2")
          (s."ansistyles@~0.1.3")
          (s."aproba@^2.0.0")
          (s."archy@~1.0.0")
          (s."bin-links@^1.1.8")
          (s."bluebird@^3.5.5")
          (s."byte-size@^5.0.1")
          (s."cacache@^12.0.3")
          (s."call-limit@^1.1.1")
          (s."chownr@^1.1.4")
          (s."ci-info@^2.0.0")
          (s."cli-columns@^3.1.2")
          (s."cli-table3@^0.5.1")
          (s."cmd-shim@^3.0.3")
          (s."columnify@~1.5.4")
          (s."config-chain@^1.1.12")
          (s."detect-indent@~5.0.0")
          (s."detect-newline@^2.1.0")
          (s."dezalgo@~1.0.3")
          (s."editor@~1.0.0")
          (s."figgy-pudding@^3.5.1")
          (s."find-npm-prefix@^1.0.2")
          (s."fs-vacuum@~1.2.10")
          (s."fs-write-stream-atomic@~1.0.10")
          (s."gentle-fs@^2.3.1")
          (s."glob@^7.1.6")
          (s."graceful-fs@^4.2.4")
          (s."has-unicode@~2.0.1")
          (s."hosted-git-info@^2.8.8")
          (s."iferr@^1.0.2")
          (s."infer-owner@^1.0.4")
          (s."inflight@~1.0.6")
          (s."inherits@^2.0.4")
          (s."ini@^1.3.5")
          (s."init-package-json@^1.10.3")
          (s."is-cidr@^3.0.0")
          (s."json-parse-better-errors@^1.0.2")
          (s."lazy-property@~1.0.0")
          (s."libcipm@^4.0.8")
          (s."libnpm@^3.0.1")
          (s."libnpmaccess@^3.0.2")
          (s."libnpmhook@^5.0.3")
          (s."libnpmorg@^1.0.1")
          (s."libnpmsearch@^2.0.2")
          (s."libnpmteam@^1.0.2")
          (s."libnpx@^10.2.4")
          (s."lock-verify@^2.1.0")
          (s."lockfile@^1.0.4")
          (s."lodash._baseuniq@~4.6.0")
          (s."lodash.clonedeep@~4.5.0")
          (s."lodash.union@~4.6.0")
          (s."lodash.uniq@~4.5.0")
          (s."lodash.without@~4.4.0")
          (s."lru-cache@^5.1.1")
          (s."meant@^1.0.2")
          (s."mississippi@^3.0.0")
          (s."mkdirp@^0.5.5")
          (s."move-concurrently@^1.0.1")
          (s."node-gyp@^5.1.0")
          (s."nopt@^4.0.3")
          (s."normalize-package-data@^2.5.0")
          (s."npm-audit-report@^1.3.3")
          (s."npm-cache-filename@~1.0.2")
          (s."npm-install-checks@^3.0.2")
          (s."npm-lifecycle@^3.1.5")
          (s."npm-package-arg@^6.1.1")
          (s."npm-packlist@^1.4.8")
          (s."npm-pick-manifest@^3.0.2")
          (s."npm-profile@^4.0.4")
          (s."npm-registry-fetch@^4.0.7")
          (s."npm-user-validate@~1.0.0")
          (s."npmlog@~4.1.2")
          (s."once@~1.4.0")
          (s."opener@^1.5.1")
          (s."osenv@^0.1.5")
          (s."pacote@^9.5.12")
          (s."path-is-inside@~1.0.2")
          (s."promise-inflight@~1.0.1")
          (s."qrcode-terminal@^0.12.0")
          (s."query-string@^6.8.2")
          (s."qw@~1.0.1")
          (s."read@~1.0.7")
          (s."read-cmd-shim@^1.0.5")
          (s."read-installed@~4.0.3")
          (s."read-package-json@^2.1.1")
          (s."read-package-tree@^5.3.1")
          (s."readable-stream@^3.6.0")
          (s."readdir-scoped-modules@^1.1.0")
          (s."request@^2.88.0")
          (s."retry@^0.12.0")
          (s."rimraf@^2.7.1")
          (s."safe-buffer@^5.1.2")
          (s."semver@^5.7.1")
          (s."sha@^3.0.0")
          (s."slide@~1.1.6")
          (s."sorted-object@~2.0.1")
          (s."sorted-union-stream@~2.1.3")
          (s."ssri@^6.0.1")
          (s."stringify-package@^1.0.1")
          (s."tar@^4.4.13")
          (s."text-table@~0.2.0")
          (s."tiny-relative-date@^1.3.0")
          (s."uid-number@0.0.6")
          (s."umask@~1.1.0")
          (s."unique-filename@^1.1.1")
          (s."unpipe@~1.0.0")
          (s."update-notifier@^2.5.0")
          (s."uuid@^3.3.3")
          (s."validate-npm-package-license@^3.0.4")
          (s."validate-npm-package-name@~3.0.0")
          (s."which@^1.3.1")
          (s."worker-farm@^1.7.0")
          (s."write-file-atomic@^2.4.3")
          ];
        "npm@^6.13.0" = s."npm@6.14.8";
        "npmlog@4.1.2" = f "npmlog" "4.1.2" y "08a7f2a8bf734604779a9efa4ad5cc717abb954b" [
          (s."are-we-there-yet@~1.1.2")
          (s."console-control-strings@~1.1.0")
          (s."gauge@~2.7.3")
          (s."set-blocking@~2.0.0")
          ];
        "npmlog@^4.1.2" = s."npmlog@4.1.2";
        "npmlog@~4.1.2" = s."npmlog@4.1.2";
        "number-is-nan@1.0.1" = f "number-is-nan" "1.0.1" y "097b602b53422a522c1afb8790318336941a011d" [];
        "number-is-nan@^1.0.0" = s."number-is-nan@1.0.1";
        "number-to-bn@1.7.0" = f "number-to-bn" "1.7.0" y "bb3623592f7e5f9e0030b1977bd41a0c53fe1ea0" [
          (s."bn.js@4.11.6")
          (s."strip-hex-prefix@1.0.0")
          ];
        "oauth-sign@0.9.0" = f "oauth-sign" "0.9.0" y "47a7b016baa68b5fa0ecf3dee08a85c679ac6455" [];
        "oauth-sign@~0.9.0" = s."oauth-sign@0.9.0";
        "object-assign@4.1.1" = f "object-assign" "4.1.1" y "2109adc7965887cfc05cbbd442cac8bfbb360863" [];
        "object-assign@^4" = s."object-assign@4.1.1";
        "object-assign@^4.0.0" = s."object-assign@4.1.1";
        "object-assign@^4.1.0" = s."object-assign@4.1.1";
        "object-assign@^4.1.1" = s."object-assign@4.1.1";
        "object-copy@0.1.0" = f "object-copy" "0.1.0" y "7e7d858b781bd7c991a41ba975ed3812754e998c" [
          (s."copy-descriptor@^0.1.0")
          (s."define-property@^0.2.5")
          (s."kind-of@^3.0.3")
          ];
        "object-copy@^0.1.0" = s."object-copy@0.1.0";
        "object-inspect@1.7.0" = f "object-inspect" "1.7.0" y "f4f6bd181ad77f006b5ece60bd0b6f398ff74a67" [];
        "object-inspect@1.8.0" = f "object-inspect" "1.8.0" y "df807e5ecf53a609cc6bfe93eac3cc7be5b3a9d0" [];
        "object-inspect@^1.8.0" = s."object-inspect@1.8.0";
        "object-inspect@~1.7.0" = s."object-inspect@1.7.0";
        "object-is@1.1.3" = f "object-is" "1.1.3" y "2e3b9e65560137455ee3bd62aec4d90a2ea1cc81" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.18.0-next.1")
          ];
        "object-is@^1.0.1" = s."object-is@1.1.3";
        "object-keys@0.4.0" = f "object-keys" "0.4.0" y "28a6aae7428dd2c3a92f3d95f21335dd204e0336" [];
        "object-keys@1.1.1" = f "object-keys" "1.1.1" y "1c47f272df277f3b1daf061677d9c82e2322c60e" [];
        "object-keys@^1.0.12" = s."object-keys@1.1.1";
        "object-keys@^1.1.1" = s."object-keys@1.1.1";
        "object-keys@~0.4.0" = s."object-keys@0.4.0";
        "object-visit@1.0.1" = f "object-visit" "1.0.1" y "f79c4493af0c5377b59fe39d395e41042dd045bb" [
          (s."isobject@^3.0.0")
          ];
        "object-visit@^1.0.0" = s."object-visit@1.0.1";
        "object.assign@4.1.1" = f "object.assign" "4.1.1" y "303867a666cdd41936ecdedfb1f8f3e32a478cdd" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.18.0-next.0")
          (s."has-symbols@^1.0.1")
          (s."object-keys@^1.1.1")
          ];
        "object.assign@^4.1.1" = s."object.assign@4.1.1";
        "object.getownpropertydescriptors@2.0.3" = f "object.getownpropertydescriptors" "2.0.3" y "8758c846f5b407adab0f236e0986f14b051caa16" [
          (s."define-properties@^1.1.2")
          (s."es-abstract@^1.5.1")
          ];
        "object.getownpropertydescriptors@2.1.0" = f "object.getownpropertydescriptors" "2.1.0" y "369bf1f9592d8ab89d712dced5cb81c7c5352649" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.0-next.1")
          ];
        "object.getownpropertydescriptors@^2.0.3" = s."object.getownpropertydescriptors@2.0.3";
        "object.getownpropertydescriptors@^2.1.0" = s."object.getownpropertydescriptors@2.1.0";
        "object.pick@1.3.0" = f "object.pick" "1.3.0" y "87a10ac4c1694bd2e1cbf53591a66141fb5dd747" [
          (s."isobject@^3.0.1")
          ];
        "object.pick@^1.3.0" = s."object.pick@1.3.0";
        "oboe@2.1.4" = f "oboe" "2.1.4" y "20c88cdb0c15371bb04119257d4fdd34b0aa49f6" [
          (s."http-https@^1.0.0")
          ];
        "on-build-webpack@0.1.0" = f "on-build-webpack" "0.1.0" y "a287c0e17766e6141926e5f2cbb0d8bb53b76814" [];
        "on-build-webpack@^0.1.0" = s."on-build-webpack@0.1.0";
        "on-finished@2.3.0" = f "on-finished" "2.3.0" y "20f1336481b083cd75337992a16971aa2d906947" [
          (s."ee-first@1.1.1")
          ];
        "on-finished@~2.3.0" = s."on-finished@2.3.0";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "once@^1.3.1" = s."once@1.4.0";
        "once@^1.4.0" = s."once@1.4.0";
        "once@~1.4.0" = s."once@1.4.0";
        "onetime@5.1.2" = f "onetime" "5.1.2" y "d0e96ebb56b07476df1dd9c4806e5237985ca45e" [
          (s."mimic-fn@^2.1.0")
          ];
        "onetime@^5.1.0" = s."onetime@5.1.2";
        "opener@1.5.1" = f "opener" "1.5.1" y "6d2f0e77f1a0af0032aca716c2c1fbb8e7e8abed" [];
        "opener@^1.5.1" = s."opener@1.5.1";
        "os-browserify@0.3.0" = f "os-browserify" "0.3.0" y "854373c7f5c2315914fc9bfc6bd8238fdda1ec27" [];
        "os-browserify@^0.3.0" = s."os-browserify@0.3.0";
        "os-homedir@1.0.2" = f "os-homedir" "1.0.2" y "ffbc4988336e0e833de0c168c7ef152121aa7fb3" [];
        "os-homedir@^1.0.0" = s."os-homedir@1.0.2";
        "os-locale@3.1.0" = f "os-locale" "3.1.0" y "a802a6ee17f24c10483ab9935719cef4ed16bf1a" [
          (s."execa@^1.0.0")
          (s."lcid@^2.0.0")
          (s."mem@^4.0.0")
          ];
        "os-locale@^3.1.0" = s."os-locale@3.1.0";
        "os-name@3.1.0" = f "os-name" "3.1.0" y "dec19d966296e1cd62d701a5a66ee1ddeae70801" [
          (s."macos-release@^2.2.0")
          (s."windows-release@^3.1.0")
          ];
        "os-name@^3.1.0" = s."os-name@3.1.0";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@^1.0.0" = s."os-tmpdir@1.0.2";
        "os-tmpdir@^1.0.1" = s."os-tmpdir@1.0.2";
        "os-tmpdir@~1.0.1" = s."os-tmpdir@1.0.2";
        "os-tmpdir@~1.0.2" = s."os-tmpdir@1.0.2";
        "osenv@0.1.5" = f "osenv" "0.1.5" y "85cdfafaeb28e8677f416e287592b5f3f49ea410" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.0")
          ];
        "osenv@^0.1.4" = s."osenv@0.1.5";
        "osenv@^0.1.5" = s."osenv@0.1.5";
        "p-cancelable@0.3.0" = f "p-cancelable" "0.3.0" y "b9e123800bcebb7ac13a479be195b507b98d30fa" [];
        "p-cancelable@1.1.0" = f "p-cancelable" "1.1.0" y "d078d15a3af409220c886f1d9a0ca2e441ab26cc" [];
        "p-cancelable@^0.3.0" = s."p-cancelable@0.3.0";
        "p-cancelable@^1.0.0" = s."p-cancelable@1.1.0";
        "p-defer@1.0.0" = f "p-defer" "1.0.0" y "9f6eb182f6c9aa8cd743004a7d4f96b196b0fb0c" [];
        "p-defer@^1.0.0" = s."p-defer@1.0.0";
        "p-each-series@2.1.0" = f "p-each-series" "2.1.0" y "961c8dd3f195ea96c747e636b262b800a6b1af48" [];
        "p-each-series@^2.1.0" = s."p-each-series@2.1.0";
        "p-filter@2.1.0" = f "p-filter" "2.1.0" y "1b1472562ae7a0f742f0f3d3d3718ea66ff9c09c" [
          (s."p-map@^2.0.0")
          ];
        "p-filter@^2.0.0" = s."p-filter@2.1.0";
        "p-finally@1.0.0" = f "p-finally" "1.0.0" y "3fbcfb15b899a44123b34b6dcc18b724336a2cae" [];
        "p-finally@^1.0.0" = s."p-finally@1.0.0";
        "p-is-promise@2.1.0" = f "p-is-promise" "2.1.0" y "918cebaea248a62cf7ffab8e3bca8c5f882fc42e" [];
        "p-is-promise@3.0.0" = f "p-is-promise" "3.0.0" y "58e78c7dfe2e163cf2a04ff869e7c1dba64a5971" [];
        "p-is-promise@^2.0.0" = s."p-is-promise@2.1.0";
        "p-is-promise@^3.0.0" = s."p-is-promise@3.0.0";
        "p-limit@1.3.0" = f "p-limit" "1.3.0" y "b86bd5f0c25690911c7590fcbfc2010d54b3ccb8" [
          (s."p-try@^1.0.0")
          ];
        "p-limit@2.3.0" = f "p-limit" "2.3.0" y "3dd33c647a214fdfffd835933eb086da0dc21db1" [
          (s."p-try@^2.0.0")
          ];
        "p-limit@^1.1.0" = s."p-limit@1.3.0";
        "p-limit@^2.0.0" = s."p-limit@2.3.0";
        "p-limit@^2.2.0" = s."p-limit@2.3.0";
        "p-locate@2.0.0" = f "p-locate" "2.0.0" y "20a0103b222a70c8fd39cc2e580680f3dde5ec43" [
          (s."p-limit@^1.1.0")
          ];
        "p-locate@3.0.0" = f "p-locate" "3.0.0" y "322d69a05c0264b25997d9f40cd8a891ab0064a4" [
          (s."p-limit@^2.0.0")
          ];
        "p-locate@4.1.0" = f "p-locate" "4.1.0" y "a3428bb7088b3a60292f66919278b7c297ad4f07" [
          (s."p-limit@^2.2.0")
          ];
        "p-locate@^2.0.0" = s."p-locate@2.0.0";
        "p-locate@^3.0.0" = s."p-locate@3.0.0";
        "p-locate@^4.1.0" = s."p-locate@4.1.0";
        "p-map@2.1.0" = f "p-map" "2.1.0" y "310928feef9c9ecc65b68b17693018a665cea175" [];
        "p-map@^2.0.0" = s."p-map@2.1.0";
        "p-reduce@2.1.0" = f "p-reduce" "2.1.0" y "09408da49507c6c274faa31f28df334bc712b64a" [];
        "p-reduce@^2.0.0" = s."p-reduce@2.1.0";
        "p-retry@4.2.0" = f "p-retry" "4.2.0" y "ea9066c6b44f23cab4cd42f6147cdbbc6604da5d" [
          (s."@types/retry@^0.12.0")
          (s."retry@^0.12.0")
          ];
        "p-retry@^4.0.0" = s."p-retry@4.2.0";
        "p-timeout@1.2.1" = f "p-timeout" "1.2.1" y "5eb3b353b7fce99f101a1038880bb054ebbea386" [
          (s."p-finally@^1.0.0")
          ];
        "p-timeout@^1.1.1" = s."p-timeout@1.2.1";
        "p-try@1.0.0" = f "p-try" "1.0.0" y "cbc79cdbaf8fd4228e13f621f2b1a237c1b207b3" [];
        "p-try@2.2.0" = f "p-try" "2.2.0" y "cb2868540e313d61de58fafbe35ce9004d5540e6" [];
        "p-try@^1.0.0" = s."p-try@1.0.0";
        "p-try@^2.0.0" = s."p-try@2.2.0";
        "package-json@4.0.1" = f "package-json" "4.0.1" y "8869a0401253661c4c4ca3da6c2121ed555f5eed" [
          (s."got@^6.7.1")
          (s."registry-auth-token@^3.0.1")
          (s."registry-url@^3.0.3")
          (s."semver@^5.1.0")
          ];
        "package-json@^4.0.0" = s."package-json@4.0.1";
        "pacote@9.5.12" = f "pacote" "9.5.12" y "1e11dd7a8d736bcc36b375a9804d41bb0377bf66" [
          (s."bluebird@^3.5.3")
          (s."cacache@^12.0.2")
          (s."chownr@^1.1.2")
          (s."figgy-pudding@^3.5.1")
          (s."get-stream@^4.1.0")
          (s."glob@^7.1.3")
          (s."infer-owner@^1.0.4")
          (s."lru-cache@^5.1.1")
          (s."make-fetch-happen@^5.0.0")
          (s."minimatch@^3.0.4")
          (s."minipass@^2.3.5")
          (s."mississippi@^3.0.0")
          (s."mkdirp@^0.5.1")
          (s."normalize-package-data@^2.4.0")
          (s."npm-normalize-package-bin@^1.0.0")
          (s."npm-package-arg@^6.1.0")
          (s."npm-packlist@^1.1.12")
          (s."npm-pick-manifest@^3.0.0")
          (s."npm-registry-fetch@^4.0.0")
          (s."osenv@^0.1.5")
          (s."promise-inflight@^1.0.1")
          (s."promise-retry@^1.1.1")
          (s."protoduck@^5.0.1")
          (s."rimraf@^2.6.2")
          (s."safe-buffer@^5.1.2")
          (s."semver@^5.6.0")
          (s."ssri@^6.0.1")
          (s."tar@^4.4.10")
          (s."unique-filename@^1.1.1")
          (s."which@^1.3.1")
          ];
        "pacote@^9.1.0" = s."pacote@9.5.12";
        "pacote@^9.5.12" = s."pacote@9.5.12";
        "pacote@^9.5.3" = s."pacote@9.5.12";
        "pako@1.0.11" = f "pako" "1.0.11" y "6c9599d340d54dfd3946380252a35705a6b992bf" [];
        "pako@~1.0.5" = s."pako@1.0.11";
        "parallel-transform@1.1.0" = f "parallel-transform" "1.1.0" y "d410f065b05da23081fcd10f28854c29bda33b06" [
          (s."cyclist@~0.2.2")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.1.5")
          ];
        "parallel-transform@^1.1.0" = s."parallel-transform@1.1.0";
        "parent-module@1.0.1" = f "parent-module" "1.0.1" y "691d2709e78c79fae3a156622452d00762caaaa2" [
          (s."callsites@^3.0.0")
          ];
        "parent-module@^1.0.0" = s."parent-module@1.0.1";
        "parse-asn1@5.1.6" = f "parse-asn1" "5.1.6" y "385080a3ec13cb62a62d39409cb3e88844cdaed4" [
          (s."asn1.js@^5.2.0")
          (s."browserify-aes@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
          (s."pbkdf2@^3.0.3")
          (s."safe-buffer@^5.1.1")
          ];
        "parse-asn1@^5.0.0" = s."parse-asn1@5.1.6";
        "parse-asn1@^5.1.5" = s."parse-asn1@5.1.6";
        "parse-headers@2.0.3" = f "parse-headers" "2.0.3" y "5e8e7512383d140ba02f0c7aa9f49b4399c92515" [];
        "parse-headers@^2.0.0" = s."parse-headers@2.0.3";
        "parse-json@4.0.0" = f "parse-json" "4.0.0" y "be35f5425be1f7f6c747184f98a788cb99477ee0" [
          (s."error-ex@^1.3.1")
          (s."json-parse-better-errors@^1.0.1")
          ];
        "parse-json@5.1.0" = f "parse-json" "5.1.0" y "f96088cdf24a8faa9aea9a009f2d9d942c999646" [
          (s."@babel/code-frame@^7.0.0")
          (s."error-ex@^1.3.1")
          (s."json-parse-even-better-errors@^2.3.0")
          (s."lines-and-columns@^1.1.6")
          ];
        "parse-json@^4.0.0" = s."parse-json@4.0.0";
        "parse-json@^5.0.0" = s."parse-json@5.1.0";
        "parse-passwd@1.0.0" = f "parse-passwd" "1.0.0" y "6d5b934a456993b23d37f40a382d6f1666a8e5c6" [];
        "parse-passwd@^1.0.0" = s."parse-passwd@1.0.0";
        "parseurl@1.3.3" = f "parseurl" "1.3.3" y "9da19e7bee8d12dff0513ed5b76957793bc2e8d4" [];
        "parseurl@~1.3.3" = s."parseurl@1.3.3";
        "pascalcase@0.1.1" = f "pascalcase" "0.1.1" y "b363e55e8006ca6fe21784d2db22bd15d7917f14" [];
        "pascalcase@^0.1.1" = s."pascalcase@0.1.1";
        "patch-package@6.2.2" = f "patch-package" "6.2.2" y "71d170d650c65c26556f0d0fbbb48d92b6cc5f39" [
          (s."@yarnpkg/lockfile@^1.1.0")
          (s."chalk@^2.4.2")
          (s."cross-spawn@^6.0.5")
          (s."find-yarn-workspace-root@^1.2.1")
          (s."fs-extra@^7.0.1")
          (s."is-ci@^2.0.0")
          (s."klaw-sync@^6.0.0")
          (s."minimist@^1.2.0")
          (s."rimraf@^2.6.3")
          (s."semver@^5.6.0")
          (s."slash@^2.0.0")
          (s."tmp@^0.0.33")
          ];
        "path-browserify@0.0.1" = f "path-browserify" "0.0.1" y "e6c4ddd7ed3aa27c68a20cc4e50e1a4ee83bbc4a" [];
        "path-dirname@1.0.2" = f "path-dirname" "1.0.2" y "cc33d24d525e099a5388c0336c6e32b9160609e0" [];
        "path-dirname@^1.0.0" = s."path-dirname@1.0.2";
        "path-exists@3.0.0" = f "path-exists" "3.0.0" y "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515" [];
        "path-exists@4.0.0" = f "path-exists" "4.0.0" y "513bdbe2d3b95d7762e8c1137efa195c6c61b5b3" [];
        "path-exists@^3.0.0" = s."path-exists@3.0.0";
        "path-exists@^4.0.0" = s."path-exists@4.0.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-is-absolute@^1.0.1" = s."path-is-absolute@1.0.1";
        "path-is-inside@1.0.2" = f "path-is-inside" "1.0.2" y "365417dede44430d1c11af61027facf074bdfc53" [];
        "path-is-inside@^1.0.1" = s."path-is-inside@1.0.2";
        "path-is-inside@^1.0.2" = s."path-is-inside@1.0.2";
        "path-is-inside@~1.0.2" = s."path-is-inside@1.0.2";
        "path-key@2.0.1" = f "path-key" "2.0.1" y "411cadb574c5a140d3a4b1910d40d80cc9f40b40" [];
        "path-key@3.1.1" = f "path-key" "3.1.1" y "581f6ade658cbba65a0d3380de7753295054f375" [];
        "path-key@^2.0.0" = s."path-key@2.0.1";
        "path-key@^2.0.1" = s."path-key@2.0.1";
        "path-key@^3.0.0" = s."path-key@3.1.1";
        "path-key@^3.1.0" = s."path-key@3.1.1";
        "path-parse@1.0.6" = f "path-parse" "1.0.6" y "d62dbb5679405d72c4737ec58600e9ddcf06d24c" [];
        "path-parse@^1.0.6" = s."path-parse@1.0.6";
        "path-to-regexp@0.1.7" = f "path-to-regexp" "0.1.7" y "df604178005f522f15eb4490e7247a1bfaa67f8c" [];
        "path-type@4.0.0" = f "path-type" "4.0.0" y "84ed01c0a7ba380afe09d90a8c180dcd9d03043b" [];
        "path-type@^4.0.0" = s."path-type@4.0.0";
        "pbkdf2@3.1.1" = f "pbkdf2" "3.1.1" y "cb8724b0fada984596856d1a6ebafd3584654b94" [
          (s."create-hash@^1.1.2")
          (s."create-hmac@^1.1.4")
          (s."ripemd160@^2.0.1")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "pbkdf2@^3.0.17" = s."pbkdf2@3.1.1";
        "pbkdf2@^3.0.3" = s."pbkdf2@3.1.1";
        "pbkdf2@^3.0.9" = s."pbkdf2@3.1.1";
        "performance-now@2.1.0" = f "performance-now" "2.1.0" y "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b" [];
        "performance-now@^2.1.0" = s."performance-now@2.1.0";
        "picomatch@2.2.2" = f "picomatch" "2.2.2" y "21f333e9b6b8eaff02468f5146ea406d345f4dad" [];
        "picomatch@^2.0.4" = s."picomatch@2.2.2";
        "picomatch@^2.0.5" = s."picomatch@2.2.2";
        "picomatch@^2.2.1" = s."picomatch@2.2.2";
        "pify@2.3.0" = f "pify" "2.3.0" y "ed141a6ac043a849ea588498e7dca8b15330e90c" [];
        "pify@3.0.0" = f "pify" "3.0.0" y "e5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176" [];
        "pify@4.0.1" = f "pify" "4.0.1" y "4b2cd25c50d598735c50292224fd8c6df41e3231" [];
        "pify@^2.3.0" = s."pify@2.3.0";
        "pify@^3.0.0" = s."pify@3.0.0";
        "pify@^4.0.1" = s."pify@4.0.1";
        "pkg-conf@2.1.0" = f "pkg-conf" "2.1.0" y "2126514ca6f2abfebd168596df18ba57867f0058" [
          (s."find-up@^2.0.0")
          (s."load-json-file@^4.0.0")
          ];
        "pkg-conf@^2.1.0" = s."pkg-conf@2.1.0";
        "pkg-dir@3.0.0" = f "pkg-dir" "3.0.0" y "2749020f239ed990881b1f71210d51eb6523bea3" [
          (s."find-up@^3.0.0")
          ];
        "pkg-dir@^3.0.0" = s."pkg-dir@3.0.0";
        "posix-character-classes@0.1.1" = f "posix-character-classes" "0.1.1" y "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab" [];
        "posix-character-classes@^0.1.0" = s."posix-character-classes@0.1.1";
        "precond@0.2" = s."precond@0.2.3";
        "precond@0.2.3" = f "precond" "0.2.3" y "aa9591bcaa24923f1e0f4849d240f47efc1075ac" [];
        "prepend-file@1.3.1" = f "prepend-file" "1.3.1" y "83b16e0b4ac1901fce88dbd945a22f4cc81df579" [
          (s."tmp@0.0.31")
          ];
        "prepend-file@^1.3.1" = s."prepend-file@1.3.1";
        "prepend-http@1.0.4" = f "prepend-http" "1.0.4" y "d4f4562b0ce3696e41ac52d0e002e57a635dc6dc" [];
        "prepend-http@2.0.0" = f "prepend-http" "2.0.0" y "e92434bfa5ea8c19f41cdfd401d741a3c819d897" [];
        "prepend-http@^1.0.1" = s."prepend-http@1.0.4";
        "prepend-http@^2.0.0" = s."prepend-http@2.0.0";
        "private@0.1.8" = f "private" "0.1.8" y "2381edb3689f7a53d653190060fcf822d2f368ff" [];
        "private@^0.1.6" = s."private@0.1.8";
        "private@^0.1.8" = s."private@0.1.8";
        "process-nextick-args@2.0.0" = f "process-nextick-args" "2.0.0" y "a37d732f4271b4ab1ad070d35508e8290788ffaa" [];
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.0";
        "process@0.11.10" = f "process" "0.11.10" y "7332300e840161bda3e69a1d1d91a7d4bc16f182" [];
        "process@0.5.2" = f "process" "0.5.2" y "1638d8a8e34c2f440a91db95ab9aeb677fc185cf" [];
        "process@^0.11.10" = s."process@0.11.10";
        "process@~0.5.1" = s."process@0.5.2";
        "promise-inflight@1.0.1" = f "promise-inflight" "1.0.1" y "98472870bf228132fcbdd868129bad12c3c029e3" [];
        "promise-inflight@^1.0.1" = s."promise-inflight@1.0.1";
        "promise-inflight@~1.0.1" = s."promise-inflight@1.0.1";
        "promise-retry@1.1.1" = f "promise-retry" "1.1.1" y "6739e968e3051da20ce6497fb2b50f6911df3d6d" [
          (s."err-code@^1.0.0")
          (s."retry@^0.10.0")
          ];
        "promise-retry@^1.1.1" = s."promise-retry@1.1.1";
        "promise-to-callback@1.0.0" = f "promise-to-callback" "1.0.0" y "5d2a749010bfb67d963598fcd3960746a68feef7" [
          (s."is-fn@^1.0.0")
          (s."set-immediate-shim@^1.0.1")
          ];
        "promise-to-callback@^1.0.0" = s."promise-to-callback@1.0.0";
        "promzard@0.3.0" = f "promzard" "0.3.0" y "26a5d6ee8c7dee4cb12208305acfb93ba382a9ee" [
          (s."read@1")
          ];
        "promzard@^0.3.0" = s."promzard@0.3.0";
        "proto-list@1.2.4" = f "proto-list" "1.2.4" y "212d5bfe1318306a420f6402b8e26ff39647a849" [];
        "proto-list@~1.2.1" = s."proto-list@1.2.4";
        "protoduck@5.0.1" = f "protoduck" "5.0.1" y "03c3659ca18007b69a50fd82a7ebcc516261151f" [
          (s."genfun@^5.0.0")
          ];
        "protoduck@^5.0.1" = s."protoduck@5.0.1";
        "proxy-addr@2.0.6" = f "proxy-addr" "2.0.6" y "fdc2336505447d3f2f2c638ed272caf614bbb2bf" [
          (s."forwarded@~0.1.2")
          (s."ipaddr.js@1.9.1")
          ];
        "proxy-addr@~2.0.5" = s."proxy-addr@2.0.6";
        "prr@1.0.1" = f "prr" "1.0.1" y "d3fc114ba06995a45ec6893f484ceb1d78f5f476" [];
        "prr@~1.0.1" = s."prr@1.0.1";
        "pseudomap@1.0.2" = f "pseudomap" "1.0.2" y "f052a28da70e618917ef0a8ac34c1ae5a68286b3" [];
        "pseudomap@^1.0.1" = s."pseudomap@1.0.2";
        "pseudomap@^1.0.2" = s."pseudomap@1.0.2";
        "psl@1.1.29" = f "psl" "1.1.29" y "60f580d360170bb722a797cc704411e6da850c67" [];
        "psl@1.8.0" = f "psl" "1.8.0" y "9326f8bcfb013adcc005fdff056acce020e51c24" [];
        "psl@^1.1.24" = s."psl@1.1.29";
        "psl@^1.1.28" = s."psl@1.8.0";
        "public-encrypt@4.0.3" = f "public-encrypt" "4.0.3" y "4fcc9d77a07e48ba7527e7cbe0de33d0701331e0" [
          (s."bn.js@^4.1.0")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."parse-asn1@^5.0.0")
          (s."randombytes@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "public-encrypt@^4.0.0" = s."public-encrypt@4.0.3";
        "pull-cat@1.1.11" = f "pull-cat" "1.1.11" y "b642dd1255da376a706b6db4fa962f5fdb74c31b" [];
        "pull-cat@^1.1.9" = s."pull-cat@1.1.11";
        "pull-defer@0.2.3" = f "pull-defer" "0.2.3" y "4ee09c6d9e227bede9938db80391c3dac489d113" [];
        "pull-defer@^0.2.2" = s."pull-defer@0.2.3";
        "pull-level@2.0.4" = f "pull-level" "2.0.4" y "4822e61757c10bdcc7cf4a03af04c92734c9afac" [
          (s."level-post@^1.0.7")
          (s."pull-cat@^1.1.9")
          (s."pull-live@^1.0.1")
          (s."pull-pushable@^2.0.0")
          (s."pull-stream@^3.4.0")
          (s."pull-window@^2.1.4")
          (s."stream-to-pull-stream@^1.7.1")
          ];
        "pull-level@^2.0.3" = s."pull-level@2.0.4";
        "pull-live@1.0.1" = f "pull-live" "1.0.1" y "a4ecee01e330155e9124bbbcf4761f21b38f51f5" [
          (s."pull-cat@^1.1.9")
          (s."pull-stream@^3.4.0")
          ];
        "pull-live@^1.0.1" = s."pull-live@1.0.1";
        "pull-pushable@2.2.0" = f "pull-pushable" "2.2.0" y "5f2f3aed47ad86919f01b12a2e99d6f1bd776581" [];
        "pull-pushable@^2.0.0" = s."pull-pushable@2.2.0";
        "pull-stream@3.6.14" = f "pull-stream" "3.6.14" y "529dbd5b86131f4a5ed636fdf7f6af00781357ee" [];
        "pull-stream@^3.2.3" = s."pull-stream@3.6.14";
        "pull-stream@^3.4.0" = s."pull-stream@3.6.14";
        "pull-stream@^3.6.8" = s."pull-stream@3.6.14";
        "pull-window@2.1.4" = f "pull-window" "2.1.4" y "fc3b86feebd1920c7ae297691e23f705f88552f0" [
          (s."looper@^2.0.0")
          ];
        "pull-window@^2.1.4" = s."pull-window@2.1.4";
        "pump@2.0.1" = f "pump" "2.0.1" y "12399add6e4cf7526d973cbc8b5ce2e2908b3909" [
          (s."end-of-stream@^1.1.0")
          (s."once@^1.3.1")
          ];
        "pump@3.0.0" = f "pump" "3.0.0" y "b4a2116815bde2f4e1ea602354e8c75565107a64" [
          (s."end-of-stream@^1.1.0")
          (s."once@^1.3.1")
          ];
        "pump@^2.0.0" = s."pump@2.0.1";
        "pump@^3.0.0" = s."pump@3.0.0";
        "pumpify@1.5.1" = f "pumpify" "1.5.1" y "36513be246ab27570b1a374a5ce278bfd74370ce" [
          (s."duplexify@^3.6.0")
          (s."inherits@^2.0.3")
          (s."pump@^2.0.0")
          ];
        "pumpify@^1.3.3" = s."pumpify@1.5.1";
        "punycode@1.3.2" = f "punycode" "1.3.2" y "9653a036fb7c1ee42342f2325cceefea3926c48d" [];
        "punycode@1.4.1" = f "punycode" "1.4.1" y "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e" [];
        "punycode@2.1.0" = f "punycode" "2.1.0" y "5f863edc89b96db09074bad7947bf09056ca4e7d" [];
        "punycode@2.1.1" = f "punycode" "2.1.1" y "b58b010ac40c22c5657616c8d2c2c02c7bf479ec" [];
        "punycode@^1.2.4" = s."punycode@1.4.1";
        "punycode@^1.4.1" = s."punycode@1.4.1";
        "punycode@^2.1.0" = s."punycode@2.1.1";
        "punycode@^2.1.1" = s."punycode@2.1.1";
        "q@1.5.1" = f "q" "1.5.1" y "7e32f75b41381291d04611f1bf14109ac00651d7" [];
        "q@^1.5.1" = s."q@1.5.1";
        "qrcode-terminal@0.12.0" = f "qrcode-terminal" "0.12.0" y "bb5b699ef7f9f0505092a3748be4464fe71b5819" [];
        "qrcode-terminal@^0.12.0" = s."qrcode-terminal@0.12.0";
        "qs@6.5.2" = f "qs" "6.5.2" y "cb3ae806e8740444584ef154ce8ee98d403f3e36" [];
        "qs@6.7.0" = f "qs" "6.7.0" y "41dc1a015e3d581f1621776be31afb2876a9b1bc" [];
        "qs@~6.5.2" = s."qs@6.5.2";
        "query-string@5.1.1" = f "query-string" "5.1.1" y "a78c012b71c17e05f2e3fa2319dd330682efb3cb" [
          (s."decode-uri-component@^0.2.0")
          (s."object-assign@^4.1.0")
          (s."strict-uri-encode@^1.0.0")
          ];
        "query-string@6.8.2" = f "query-string" "6.8.2" y "36cb7e452ae11a4b5e9efee83375e0954407b2f6" [
          (s."decode-uri-component@^0.2.0")
          (s."split-on-first@^1.0.0")
          (s."strict-uri-encode@^2.0.0")
          ];
        "query-string@^5.0.1" = s."query-string@5.1.1";
        "query-string@^6.8.2" = s."query-string@6.8.2";
        "querystring-es3@0.2.1" = f "querystring-es3" "0.2.1" y "9ec61f79049875707d69414596fd907a4d711e73" [];
        "querystring-es3@^0.2.0" = s."querystring-es3@0.2.1";
        "querystring@0.2.0" = f "querystring" "0.2.0" y "b209849203bb25df820da756e747005878521620" [];
        "quick-lru@4.0.1" = f "quick-lru" "4.0.1" y "5b8878f113a58217848c6482026c73e1ba57727f" [];
        "quick-lru@^4.0.1" = s."quick-lru@4.0.1";
        "qw@1.0.1" = f "qw" "1.0.1" y "efbfdc740f9ad054304426acb183412cc8b996d4" [];
        "qw@~1.0.1" = s."qw@1.0.1";
        "randombytes@2.1.0" = f "randombytes" "2.1.0" y "df6f84372f0270dc65cdf6291349ab7a473d4f2a" [
          (s."safe-buffer@^5.1.0")
          ];
        "randombytes@^2.0.0" = s."randombytes@2.1.0";
        "randombytes@^2.0.1" = s."randombytes@2.1.0";
        "randombytes@^2.0.5" = s."randombytes@2.1.0";
        "randombytes@^2.0.6" = s."randombytes@2.1.0";
        "randombytes@^2.1.0" = s."randombytes@2.1.0";
        "randomfill@1.0.4" = f "randomfill" "1.0.4" y "c92196fc86ab42be983f1bf31778224931d61458" [
          (s."randombytes@^2.0.5")
          (s."safe-buffer@^5.1.0")
          ];
        "randomfill@^1.0.3" = s."randomfill@1.0.4";
        "range-parser@1.2.1" = f "range-parser" "1.2.1" y "3cf37023d199e1c24d1a55b84800c2f3e6468031" [];
        "range-parser@~1.2.1" = s."range-parser@1.2.1";
        "raw-body@2.4.0" = f "raw-body" "2.4.0" y "a1ce6fb9c9bc356ca52e89256ab59059e13d0332" [
          (s."bytes@3.1.0")
          (s."http-errors@1.7.2")
          (s."iconv-lite@0.4.24")
          (s."unpipe@1.0.0")
          ];
        "rc@1.2.8" = f "rc" "1.2.8" y "cd924bf5200a075b83c188cd6b9e211b7fc0d3ed" [
          (s."deep-extend@^0.6.0")
          (s."ini@~1.3.0")
          (s."minimist@^1.2.0")
          (s."strip-json-comments@~2.0.1")
          ];
        "rc@^1.0.1" = s."rc@1.2.8";
        "rc@^1.1.6" = s."rc@1.2.8";
        "rc@^1.2.8" = s."rc@1.2.8";
        "read-cmd-shim@1.0.5" = f "read-cmd-shim" "1.0.5" y "87e43eba50098ba5a32d0ceb583ab8e43b961c16" [
          (s."graceful-fs@^4.1.2")
          ];
        "read-cmd-shim@^1.0.1" = s."read-cmd-shim@1.0.5";
        "read-cmd-shim@^1.0.5" = s."read-cmd-shim@1.0.5";
        "read-installed@4.0.3" = f "read-installed" "4.0.3" y "ff9b8b67f187d1e4c29b9feb31f6b223acd19067" [
          (s."debuglog@^1.0.1")
          (s."read-package-json@^2.0.0")
          (s."readdir-scoped-modules@^1.0.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."slide@~1.1.3")
          (s."util-extend@^1.0.1")
          (s."graceful-fs@^4.1.2")
          ];
        "read-installed@~4.0.3" = s."read-installed@4.0.3";
        "read-package-json@1 || 2" = s."read-package-json@2.1.1";
        "read-package-json@2.1.1" = f "read-package-json" "2.1.1" y "16aa66c59e7d4dad6288f179dd9295fd59bb98f1" [
          (s."glob@^7.1.1")
          (s."json-parse-better-errors@^1.0.1")
          (s."normalize-package-data@^2.0.0")
          (s."npm-normalize-package-bin@^1.0.0")
          (s."graceful-fs@^4.1.2")
          ];
        "read-package-json@^2.0.0" = s."read-package-json@2.1.1";
        "read-package-json@^2.0.13" = s."read-package-json@2.1.1";
        "read-package-json@^2.1.1" = s."read-package-json@2.1.1";
        "read-package-tree@5.3.1" = f "read-package-tree" "5.3.1" y "a32cb64c7f31eb8a6f31ef06f9cedf74068fe636" [
          (s."read-package-json@^2.0.0")
          (s."readdir-scoped-modules@^1.0.0")
          (s."util-promisify@^2.1.0")
          ];
        "read-package-tree@^5.3.1" = s."read-package-tree@5.3.1";
        "read-pkg-up@7.0.1" = f "read-pkg-up" "7.0.1" y "f3a6135758459733ae2b95638056e1854e7ef507" [
          (s."find-up@^4.1.0")
          (s."read-pkg@^5.2.0")
          (s."type-fest@^0.8.1")
          ];
        "read-pkg-up@^7.0.0" = s."read-pkg-up@7.0.1";
        "read-pkg-up@^7.0.1" = s."read-pkg-up@7.0.1";
        "read-pkg@5.2.0" = f "read-pkg" "5.2.0" y "7bf295438ca5a33e56cd30e053b34ee7250c93cc" [
          (s."@types/normalize-package-data@^2.4.0")
          (s."normalize-package-data@^2.5.0")
          (s."parse-json@^5.0.0")
          (s."type-fest@^0.6.0")
          ];
        "read-pkg@^5.0.0" = s."read-pkg@5.2.0";
        "read-pkg@^5.2.0" = s."read-pkg@5.2.0";
        "read@1" = s."read@1.0.7";
        "read@1.0.7" = f "read" "1.0.7" y "b3da19bd052431a97671d44a42634adf710b40c4" [
          (s."mute-stream@~0.0.4")
          ];
        "read@~1.0.1" = s."read@1.0.7";
        "read@~1.0.7" = s."read@1.0.7";
        "readable-stream@1 || 2" = s."readable-stream@2.3.6";
        "readable-stream@1.0.34" = f "readable-stream" "1.0.34" y "125820e34bc842d2f2aaafafe4c2916ee32c157c" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@0.0.1")
          (s."string_decoder@~0.10.x")
          ];
        "readable-stream@1.1.14" = f "readable-stream" "1.1.14" y "7cf4c54ef648e3813084c636dd2079e166c081d9" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.1")
          (s."isarray@0.0.1")
          (s."string_decoder@~0.10.x")
          ];
        "readable-stream@2 || 3" = s."readable-stream@3.6.0";
        "readable-stream@2.3.6" = f "readable-stream" "2.3.6" y "b11c27d88b8ff1fbe070643cf94b0c79ae1b0aaf" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
          ];
        "readable-stream@2.3.7" = f "readable-stream" "2.3.7" y "1eca1cf711aef814c04f62252a36a62f6cb23b57" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
          ];
        "readable-stream@3.6.0" = f "readable-stream" "3.6.0" y "337bbda3adc0706bd3e024426a286d4b4b2c9198" [
          (s."inherits@^2.0.3")
          (s."string_decoder@^1.1.1")
          (s."util-deprecate@^1.0.1")
          ];
        "readable-stream@^1.0.33" = s."readable-stream@1.1.14";
        "readable-stream@^2.0.0" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.1" = s."readable-stream@2.3.7";
        "readable-stream@^2.0.2" = s."readable-stream@2.3.7";
        "readable-stream@^2.0.4" = s."readable-stream@2.3.6";
        "readable-stream@^2.0.5" = s."readable-stream@2.3.7";
        "readable-stream@^2.0.6" = s."readable-stream@2.3.6";
        "readable-stream@^2.1.5" = s."readable-stream@2.3.6";
        "readable-stream@^2.2.2" = s."readable-stream@2.3.6";
        "readable-stream@^2.2.8" = s."readable-stream@2.3.7";
        "readable-stream@^2.2.9" = s."readable-stream@2.3.7";
        "readable-stream@^2.3.3" = s."readable-stream@2.3.7";
        "readable-stream@^2.3.6" = s."readable-stream@2.3.7";
        "readable-stream@^3.0.6" = s."readable-stream@3.6.0";
        "readable-stream@^3.6.0" = s."readable-stream@3.6.0";
        "readable-stream@~1.0.15" = s."readable-stream@1.0.34";
        "readable-stream@~1.1.10" = s."readable-stream@1.1.14";
        "readable-stream@~2.3.6" = s."readable-stream@2.3.7";
        "readdir-scoped-modules@1.1.0" = f "readdir-scoped-modules" "1.1.0" y "8d45407b4f870a0dcaebc0e28670d18e74514309" [
          (s."debuglog@^1.0.1")
          (s."dezalgo@^1.0.0")
          (s."graceful-fs@^4.1.2")
          (s."once@^1.3.0")
          ];
        "readdir-scoped-modules@^1.0.0" = s."readdir-scoped-modules@1.1.0";
        "readdir-scoped-modules@^1.1.0" = s."readdir-scoped-modules@1.1.0";
        "readdirp@2.2.1" = f "readdirp" "2.2.1" y "0e87622a3325aa33e892285caf8b4e846529a525" [
          (s."graceful-fs@^4.1.11")
          (s."micromatch@^3.1.10")
          (s."readable-stream@^2.0.2")
          ];
        "readdirp@3.4.0" = f "readdirp" "3.4.0" y "9fdccdf9e9155805449221ac645e8303ab5b9ada" [
          (s."picomatch@^2.2.1")
          ];
        "readdirp@^2.2.1" = s."readdirp@2.2.1";
        "readdirp@~3.4.0" = s."readdirp@3.4.0";
        "redent@3.0.0" = f "redent" "3.0.0" y "e557b7998316bb53c9f1f56fa626352c6963059f" [
          (s."indent-string@^4.0.0")
          (s."strip-indent@^3.0.0")
          ];
        "redent@^3.0.0" = s."redent@3.0.0";
        "redeyed@2.1.1" = f "redeyed" "2.1.1" y "8984b5815d99cb220469c99eeeffe38913e6cc0b" [
          (s."esprima@~4.0.0")
          ];
        "redeyed@~2.1.0" = s."redeyed@2.1.1";
        "regenerate@1.4.1" = f "regenerate" "1.4.1" y "cad92ad8e6b591773485fbe05a485caf4f457e6f" [];
        "regenerate@^1.2.1" = s."regenerate@1.4.1";
        "regenerator-runtime@0.11.1" = f "regenerator-runtime" "0.11.1" y "be05ad7f9bf7d22e056f9726cee5017fbf19e2e9" [];
        "regenerator-runtime@^0.11.0" = s."regenerator-runtime@0.11.1";
        "regenerator-transform@0.10.1" = f "regenerator-transform" "0.10.1" y "1e4996837231da8b7f3cf4114d71b5691a0680dd" [
          (s."babel-runtime@^6.18.0")
          (s."babel-types@^6.19.0")
          (s."private@^0.1.6")
          ];
        "regenerator-transform@^0.10.0" = s."regenerator-transform@0.10.1";
        "regex-not@1.0.2" = f "regex-not" "1.0.2" y "1f4ece27e00b0b65e0247a6810e6a85d83a5752c" [
          (s."extend-shallow@^3.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "regex-not@^1.0.0" = s."regex-not@1.0.2";
        "regex-not@^1.0.2" = s."regex-not@1.0.2";
        "regexp.prototype.flags@1.3.0" = f "regexp.prototype.flags" "1.3.0" y "7aba89b3c13a64509dabcf3ca8d9fbb9bdf5cb75" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.0-next.1")
          ];
        "regexp.prototype.flags@^1.2.0" = s."regexp.prototype.flags@1.3.0";
        "regexpu-core@2.0.0" = f "regexpu-core" "2.0.0" y "49d038837b8dcf8bfa5b9a42139938e6ea2ae240" [
          (s."regenerate@^1.2.1")
          (s."regjsgen@^0.2.0")
          (s."regjsparser@^0.1.4")
          ];
        "regexpu-core@^2.0.0" = s."regexpu-core@2.0.0";
        "registry-auth-token@3.4.0" = f "registry-auth-token" "3.4.0" y "d7446815433f5d5ed6431cd5dca21048f66b397e" [
          (s."rc@^1.1.6")
          (s."safe-buffer@^5.0.1")
          ];
        "registry-auth-token@4.2.0" = f "registry-auth-token" "4.2.0" y "1d37dffda72bbecd0f581e4715540213a65eb7da" [
          (s."rc@^1.2.8")
          ];
        "registry-auth-token@^3.0.1" = s."registry-auth-token@3.4.0";
        "registry-auth-token@^4.0.0" = s."registry-auth-token@4.2.0";
        "registry-url@3.1.0" = f "registry-url" "3.1.0" y "3d4ef870f73dde1d77f0cf9a381432444e174942" [
          (s."rc@^1.0.1")
          ];
        "registry-url@^3.0.3" = s."registry-url@3.1.0";
        "regjsgen@0.2.0" = f "regjsgen" "0.2.0" y "6c016adeac554f75823fe37ac05b92d5a4edb1f7" [];
        "regjsgen@^0.2.0" = s."regjsgen@0.2.0";
        "regjsparser@0.1.5" = f "regjsparser" "0.1.5" y "7ee8f84dc6fa792d3fd0ae228d24bd949ead205c" [
          (s."jsesc@~0.5.0")
          ];
        "regjsparser@^0.1.4" = s."regjsparser@0.1.5";
        "remove-trailing-separator@1.1.0" = f "remove-trailing-separator" "1.1.0" y "c24bce2a283adad5bc3f58e0d48249b92379d8ef" [];
        "remove-trailing-separator@^1.0.1" = s."remove-trailing-separator@1.1.0";
        "repeat-element@1.1.3" = f "repeat-element" "1.1.3" y "782e0d825c0c5a3bb39731f84efee6b742e6b1ce" [];
        "repeat-element@^1.1.2" = s."repeat-element@1.1.3";
        "repeat-string@1.6.1" = f "repeat-string" "1.6.1" y "8dcae470e1c88abc2d600fff4a776286da75e637" [];
        "repeat-string@^1.6.1" = s."repeat-string@1.6.1";
        "repeating@2.0.1" = f "repeating" "2.0.1" y "5214c53a926d3552707527fbab415dbc08d06dda" [
          (s."is-finite@^1.0.0")
          ];
        "repeating@^2.0.0" = s."repeating@2.0.1";
        "request@2.88.0" = f "request" "2.88.0" y "9c2fca4f7d35b592efe57c7f0a55e81052124fef" [
          (s."aws-sign2@~0.7.0")
          (s."aws4@^1.8.0")
          (s."caseless@~0.12.0")
          (s."combined-stream@~1.0.6")
          (s."extend@~3.0.2")
          (s."forever-agent@~0.6.1")
          (s."form-data@~2.3.2")
          (s."har-validator@~5.1.0")
          (s."http-signature@~1.2.0")
          (s."is-typedarray@~1.0.0")
          (s."isstream@~0.1.2")
          (s."json-stringify-safe@~5.0.1")
          (s."mime-types@~2.1.19")
          (s."oauth-sign@~0.9.0")
          (s."performance-now@^2.1.0")
          (s."qs@~6.5.2")
          (s."safe-buffer@^5.1.2")
          (s."tough-cookie@~2.4.3")
          (s."tunnel-agent@^0.6.0")
          (s."uuid@^3.3.2")
          ];
        "request@2.88.2" = f "request" "2.88.2" y "d73c918731cb5a87da047e207234146f664d12b3" [
          (s."aws-sign2@~0.7.0")
          (s."aws4@^1.8.0")
          (s."caseless@~0.12.0")
          (s."combined-stream@~1.0.6")
          (s."extend@~3.0.2")
          (s."forever-agent@~0.6.1")
          (s."form-data@~2.3.2")
          (s."har-validator@~5.1.3")
          (s."http-signature@~1.2.0")
          (s."is-typedarray@~1.0.0")
          (s."isstream@~0.1.2")
          (s."json-stringify-safe@~5.0.1")
          (s."mime-types@~2.1.19")
          (s."oauth-sign@~0.9.0")
          (s."performance-now@^2.1.0")
          (s."qs@~6.5.2")
          (s."safe-buffer@^5.1.2")
          (s."tough-cookie@~2.5.0")
          (s."tunnel-agent@^0.6.0")
          (s."uuid@^3.3.2")
          ];
        "request@^2.79.0" = s."request@2.88.2";
        "request@^2.85.0" = s."request@2.88.2";
        "request@^2.88.0" = s."request@2.88.0";
        "require-directory@2.1.1" = f "require-directory" "2.1.1" y "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42" [];
        "require-directory@^2.1.1" = s."require-directory@2.1.1";
        "require-main-filename@2.0.0" = f "require-main-filename" "2.0.0" y "d0b329ecc7cc0f61649f62215be69af54aa8989b" [];
        "require-main-filename@^2.0.0" = s."require-main-filename@2.0.0";
        "resolve-cwd@2.0.0" = f "resolve-cwd" "2.0.0" y "00a9f7387556e27038eae232caa372a6a59b665a" [
          (s."resolve-from@^3.0.0")
          ];
        "resolve-cwd@^2.0.0" = s."resolve-cwd@2.0.0";
        "resolve-dir@1.0.1" = f "resolve-dir" "1.0.1" y "79a40644c362be82f26effe739c9bb5382046f43" [
          (s."expand-tilde@^2.0.0")
          ];
        "resolve-dir@^1.0.0" = s."resolve-dir@1.0.1";
        "resolve-dir@^1.0.1" = s."resolve-dir@1.0.1";
        "resolve-from@3.0.0" = f "resolve-from" "3.0.0" y "b22c7af7d9d6881bc8b6e653335eebcb0a188748" [];
        "resolve-from@4.0.0" = f "resolve-from" "4.0.0" y "4abcd852ad32dd7baabfe9b40e00a36db5f392e6" [];
        "resolve-from@5.0.0" = f "resolve-from" "5.0.0" y "c35225843df8f776df21c57557bc087e9dfdfc69" [];
        "resolve-from@^3.0.0" = s."resolve-from@3.0.0";
        "resolve-from@^4.0.0" = s."resolve-from@4.0.0";
        "resolve-from@^5.0.0" = s."resolve-from@5.0.0";
        "resolve-url@0.2.1" = f "resolve-url" "0.2.1" y "2c637fe77c893afd2a663fe21aa9080068e2052a" [];
        "resolve-url@^0.2.1" = s."resolve-url@0.2.1";
        "resolve@1.17.0" = f "resolve" "1.17.0" y "b25941b54968231cc2d1bb76a79cb7f2c0bf8444" [
          (s."path-parse@^1.0.6")
          ];
        "resolve@^1.10.0" = s."resolve@1.17.0";
        "resolve@~1.17.0" = s."resolve@1.17.0";
        "responselike@1.0.2" = f "responselike" "1.0.2" y "918720ef3b631c5642be068f15ade5a46f4ba1e7" [
          (s."lowercase-keys@^1.0.0")
          ];
        "responselike@^1.0.2" = s."responselike@1.0.2";
        "resumer@0.0.0" = f "resumer" "0.0.0" y "f1e8f461e4064ba39e82af3cdc2a8c893d076759" [
          (s."through@~2.3.4")
          ];
        "resumer@~0.0.0" = s."resumer@0.0.0";
        "ret@0.1.15" = f "ret" "0.1.15" y "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc" [];
        "ret@~0.1.10" = s."ret@0.1.15";
        "retry@0.10.1" = f "retry" "0.10.1" y "e76388d217992c252750241d3d3956fed98d8ff4" [];
        "retry@0.12.0" = f "retry" "0.12.0" y "1b42a6266a21f07421d1b0b54b7dc167b01c013b" [];
        "retry@^0.10.0" = s."retry@0.10.1";
        "retry@^0.12.0" = s."retry@0.12.0";
        "reusify@1.0.4" = f "reusify" "1.0.4" y "90da382b1e126efc02146e90845a88db12925d76" [];
        "reusify@^1.0.4" = s."reusify@1.0.4";
        "rimraf@2.7.1" = f "rimraf" "2.7.1" y "35797f13a7fdadc566142c29d4f07ccad483e3ec" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^2.5.2" = s."rimraf@2.7.1";
        "rimraf@^2.5.4" = s."rimraf@2.7.1";
        "rimraf@^2.6.2" = s."rimraf@2.7.1";
        "rimraf@^2.6.3" = s."rimraf@2.7.1";
        "rimraf@^2.7.1" = s."rimraf@2.7.1";
        "ripemd160@2.0.2" = f "ripemd160" "2.0.2" y "a1c1a6f624751577ba5d07914cbc92850585890c" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          ];
        "ripemd160@^2.0.0" = s."ripemd160@2.0.2";
        "ripemd160@^2.0.1" = s."ripemd160@2.0.2";
        "rlp@2.2.6" = f "rlp" "2.2.6" y "c80ba6266ac7a483ef1e69e8e2f056656de2fb2c" [
          (s."bn.js@^4.11.1")
          ];
        "rlp@^2.0.0" = s."rlp@2.2.6";
        "rlp@^2.2.1" = s."rlp@2.2.6";
        "rlp@^2.2.2" = s."rlp@2.2.6";
        "rlp@^2.2.3" = s."rlp@2.2.6";
        "rlp@^2.2.4" = s."rlp@2.2.6";
        "run-parallel@1.1.9" = f "run-parallel" "1.1.9" y "c9dd3a7cf9f4b2c4b6244e173a6ed866e61dd679" [];
        "run-parallel@^1.1.9" = s."run-parallel@1.1.9";
        "run-queue@1.0.3" = f "run-queue" "1.0.3" y "e848396f057d223f24386924618e25694161ec47" [
          (s."aproba@^1.1.1")
          ];
        "run-queue@^1.0.0" = s."run-queue@1.0.3";
        "run-queue@^1.0.3" = s."run-queue@1.0.3";
        "rustbn.js@0.2.0" = f "rustbn.js" "0.2.0" y "8082cb886e707155fd1cb6f23bd591ab8d55d0ca" [];
        "rustbn.js@~0.2.0" = s."rustbn.js@0.2.0";
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@5.2.1" = f "safe-buffer" "5.2.1" y "1eaf9fa9bdb1fdd4ec75f58f9cdb4e6b7827eec6" [];
        "safe-buffer@^5.0.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.1" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.1.2";
        "safe-buffer@^5.2.0" = s."safe-buffer@5.2.1";
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.2.0" = s."safe-buffer@5.2.1";
        "safe-event-emitter@1.0.1" = f "safe-event-emitter" "1.0.1" y "5b692ef22329ed8f69fdce607e50ca734f6f20af" [
          (s."events@^3.0.0")
          ];
        "safe-event-emitter@^1.0.1" = s."safe-event-emitter@1.0.1";
        "safe-regex@1.1.0" = f "safe-regex" "1.1.0" y "40a3669f3b077d1e943d44629e157dd48023bf2e" [
          (s."ret@~0.1.10")
          ];
        "safe-regex@^1.1.0" = s."safe-regex@1.1.0";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "safer-buffer@>= 2.1.2 < 3.0.0" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.0.2" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.1.0" = s."safer-buffer@2.1.2";
        "safer-buffer@~2.1.0" = s."safer-buffer@2.1.2";
        "schema-utils@1.0.0" = f "schema-utils" "1.0.0" y "0b79a93204d7b600d4b2850d1f66c2a34951c770" [
          (s."ajv@^6.1.0")
          (s."ajv-errors@^1.0.0")
          (s."ajv-keywords@^3.1.0")
          ];
        "schema-utils@^1.0.0" = s."schema-utils@1.0.0";
        "scrypt-js@3.0.1" = f "scrypt-js" "3.0.1" y "d314a57c2aef69d1ad98a138a21fe9eafa9ee312" [];
        "scrypt-js@^3.0.0" = s."scrypt-js@3.0.1";
        "scrypt-js@^3.0.1" = s."scrypt-js@3.0.1";
        "scryptsy@1.2.1" = f "scryptsy" "1.2.1" y "a3225fa4b2524f802700761e2855bdf3b2d92163" [
          (s."pbkdf2@^3.0.3")
          ];
        "scryptsy@^1.2.1" = s."scryptsy@1.2.1";
        "secp256k1@4.0.2" = f "secp256k1" "4.0.2" y "15dd57d0f0b9fdb54ac1fa1694f40e5e9a54f4a1" [
          (s."elliptic@^6.5.2")
          (s."node-addon-api@^2.0.0")
          (s."node-gyp-build@^4.2.0")
          ];
        "secp256k1@^4.0.1" = s."secp256k1@4.0.2";
        "seedrandom@3.0.1" = f "seedrandom" "3.0.1" y "eb3dde015bcf55df05a233514e5df44ef9dce083" [];
        "semantic-release@17.1.2" = f "semantic-release" "17.1.2" y "7d77555185722012b34e3ca74e4d13f813daf3cd" [
          (s."@semantic-release/commit-analyzer@^8.0.0")
          (s."@semantic-release/error@^2.2.0")
          (s."@semantic-release/github@^7.0.0")
          (s."@semantic-release/npm@^7.0.0")
          (s."@semantic-release/release-notes-generator@^9.0.0")
          (s."aggregate-error@^3.0.0")
          (s."cosmiconfig@^6.0.0")
          (s."debug@^4.0.0")
          (s."env-ci@^5.0.0")
          (s."execa@^4.0.0")
          (s."figures@^3.0.0")
          (s."find-versions@^3.0.0")
          (s."get-stream@^5.0.0")
          (s."git-log-parser@^1.2.0")
          (s."hook-std@^2.0.0")
          (s."hosted-git-info@^3.0.0")
          (s."lodash@^4.17.15")
          (s."marked@^1.0.0")
          (s."marked-terminal@^4.0.0")
          (s."micromatch@^4.0.2")
          (s."p-each-series@^2.1.0")
          (s."p-reduce@^2.0.0")
          (s."read-pkg-up@^7.0.0")
          (s."resolve-from@^5.0.0")
          (s."semver@^7.3.2")
          (s."semver-diff@^3.1.1")
          (s."signale@^1.2.1")
          (s."yargs@^15.0.1")
          ];
        "semantic-release@^17.1.1" = s."semantic-release@17.1.2";
        "semaphore@1.1.0" = f "semaphore" "1.1.0" y "aaad8b86b20fe8e9b32b16dc2ee682a8cd26a8aa" [];
        "semaphore@>=1.0.1" = s."semaphore@1.1.0";
        "semaphore@^1.0.3" = s."semaphore@1.1.0";
        "semaphore@^1.1.0" = s."semaphore@1.1.0";
        "semver-diff@2.1.0" = f "semver-diff" "2.1.0" y "4bbb8437c8d37e4b0cf1a68fd726ec6d645d6d36" [
          (s."semver@^5.0.3")
          ];
        "semver-diff@3.1.1" = f "semver-diff" "3.1.1" y "05f77ce59f325e00e2706afd67bb506ddb1ca32b" [
          (s."semver@^6.3.0")
          ];
        "semver-diff@^2.0.0" = s."semver-diff@2.1.0";
        "semver-diff@^3.1.1" = s."semver-diff@3.1.1";
        "semver-regex@2.0.0" = f "semver-regex" "2.0.0" y "a93c2c5844539a770233379107b38c7b4ac9d338" [];
        "semver-regex@^2.0.0" = s."semver-regex@2.0.0";
        "semver@2 || 3 || 4 || 5" = s."semver@5.7.1";
        "semver@2.x || 3.x || 4 || 5" = s."semver@5.7.1";
        "semver@5.4.1" = f "semver" "5.4.1" y "e059c09d8571f0540823733433505d3a2f00b18e" [];
        "semver@5.7.1" = f "semver" "5.7.1" y "a954f931aeba508d307bbf069eff0c01c96116f7" [];
        "semver@6.3.0" = f "semver" "6.3.0" y "ee0a64c8af5e8ceea67687b133761e1becbd1d3d" [];
        "semver@7.3.2" = f "semver" "7.3.2" y "604962b052b81ed0786aae84389ffba70ffd3938" [];
        "semver@^2.3.0 || 3.x || 4 || 5" = s."semver@5.7.1";
        "semver@^5.0.3" = s."semver@5.7.1";
        "semver@^5.1.0" = s."semver@5.7.1";
        "semver@^5.3.0" = s."semver@5.7.1";
        "semver@^5.4.1" = s."semver@5.7.1";
        "semver@^5.5.0" = s."semver@5.7.1";
        "semver@^5.5.1" = s."semver@5.7.1";
        "semver@^5.6.0" = s."semver@5.7.1";
        "semver@^5.7.1" = s."semver@5.7.1";
        "semver@^6.0.0" = s."semver@6.3.0";
        "semver@^6.3.0" = s."semver@6.3.0";
        "semver@^7.1.2" = s."semver@7.3.2";
        "semver@^7.3.2" = s."semver@7.3.2";
        "semver@~5.4.1" = s."semver@5.4.1";
        "send@0.17.1" = f "send" "0.17.1" y "c1d8b059f7900f7466dd4938bdc44e11ddb376c8" [
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."destroy@~1.0.4")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."fresh@0.5.2")
          (s."http-errors@~1.7.2")
          (s."mime@1.6.0")
          (s."ms@2.1.1")
          (s."on-finished@~2.3.0")
          (s."range-parser@~1.2.1")
          (s."statuses@~1.5.0")
          ];
        "serialize-javascript@4.0.0" = f "serialize-javascript" "4.0.0" y "b525e1238489a5ecfc42afacc3fe99e666f4b1aa" [
          (s."randombytes@^2.1.0")
          ];
        "serialize-javascript@^4.0.0" = s."serialize-javascript@4.0.0";
        "serve-static@1.14.1" = f "serve-static" "1.14.1" y "666e636dc4f010f7ef29970a88a674320898b2f9" [
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."parseurl@~1.3.3")
          (s."send@0.17.1")
          ];
        "servify@0.1.12" = f "servify" "0.1.12" y "142ab7bee1f1d033b66d0707086085b17c06db95" [
          (s."body-parser@^1.16.0")
          (s."cors@^2.8.1")
          (s."express@^4.14.0")
          (s."request@^2.79.0")
          (s."xhr@^2.3.3")
          ];
        "servify@^0.1.12" = s."servify@0.1.12";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@^2.0.0" = s."set-blocking@2.0.0";
        "set-blocking@~2.0.0" = s."set-blocking@2.0.0";
        "set-immediate-shim@1.0.1" = f "set-immediate-shim" "1.0.1" y "4b2b1b27eb808a9f8dcc481a58e5e56f599f3f61" [];
        "set-immediate-shim@^1.0.1" = s."set-immediate-shim@1.0.1";
        "set-value@2.0.1" = f "set-value" "2.0.1" y "a18d40530e6f07de4228c7defe4227af8cad005b" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.3")
          (s."split-string@^3.0.1")
          ];
        "set-value@^2.0.0" = s."set-value@2.0.1";
        "set-value@^2.0.1" = s."set-value@2.0.1";
        "setimmediate@1.0.5" = f "setimmediate" "1.0.5" y "290cbb232e306942d7d7ea9b83732ab7856f8285" [];
        "setimmediate@^1.0.4" = s."setimmediate@1.0.5";
        "setimmediate@^1.0.5" = s."setimmediate@1.0.5";
        "setprototypeof@1.1.1" = f "setprototypeof" "1.1.1" y "7e95acb24aa92f5885e0abef5ba131330d4ae683" [];
        "sha.js@2.4.11" = f "sha.js" "2.4.11" y "37a5cf0b81ecbc6943de109ba2960d1b26584ae7" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "sha.js@^2.4.0" = s."sha.js@2.4.11";
        "sha.js@^2.4.8" = s."sha.js@2.4.11";
        "sha@3.0.0" = f "sha" "3.0.0" y "b2f2f90af690c16a3a839a6a6c680ea51fedd1ae" [
          (s."graceful-fs@^4.1.2")
          ];
        "sha@^3.0.0" = s."sha@3.0.0";
        "shebang-command@1.2.0" = f "shebang-command" "1.2.0" y "44aac65b695b03398968c39f363fee5deafdf1ea" [
          (s."shebang-regex@^1.0.0")
          ];
        "shebang-command@2.0.0" = f "shebang-command" "2.0.0" y "ccd0af4f8835fbdc265b82461aaf0c36663f34ea" [
          (s."shebang-regex@^3.0.0")
          ];
        "shebang-command@^1.2.0" = s."shebang-command@1.2.0";
        "shebang-command@^2.0.0" = s."shebang-command@2.0.0";
        "shebang-loader@0.0.1" = f "shebang-loader" "0.0.1" y "a4000495d44cceefbec63435e7b1698569fa52ec" [];
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@3.0.0" = f "shebang-regex" "3.0.0" y "ae16f1644d873ecad843b0307b143362d4c42172" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "shebang-regex@^3.0.0" = s."shebang-regex@3.0.0";
        "signal-exit@3.0.2" = f "signal-exit" "3.0.2" y "b5fdc08f1287ea1178628e415e25132b73646c6d" [];
        "signal-exit@^3.0.0" = s."signal-exit@3.0.2";
        "signal-exit@^3.0.2" = s."signal-exit@3.0.2";
        "signale@1.4.0" = f "signale" "1.4.0" y "c4be58302fb0262ac00fc3d886a7c113759042f1" [
          (s."chalk@^2.3.2")
          (s."figures@^2.0.0")
          (s."pkg-conf@^2.1.0")
          ];
        "signale@^1.2.1" = s."signale@1.4.0";
        "simple-concat@1.0.1" = f "simple-concat" "1.0.1" y "f46976082ba35c2263f1c8ab5edfe26c41c9552f" [];
        "simple-concat@^1.0.0" = s."simple-concat@1.0.1";
        "simple-get@2.8.1" = f "simple-get" "2.8.1" y "0e22e91d4575d87620620bc91308d57a77f44b5d" [
          (s."decompress-response@^3.3.0")
          (s."once@^1.3.1")
          (s."simple-concat@^1.0.0")
          ];
        "simple-get@^2.7.0" = s."simple-get@2.8.1";
        "slash@1.0.0" = f "slash" "1.0.0" y "c41f2f6c39fc16d1cd17ad4b5d896114ae470d55" [];
        "slash@2.0.0" = f "slash" "2.0.0" y "de552851a1759df3a8f206535442f5ec4ddeab44" [];
        "slash@3.0.0" = f "slash" "3.0.0" y "6539be870c165adbd5240220dbe361f1bc4d4634" [];
        "slash@^1.0.0" = s."slash@1.0.0";
        "slash@^2.0.0" = s."slash@2.0.0";
        "slash@^3.0.0" = s."slash@3.0.0";
        "slide@1.1.6" = f "slide" "1.1.6" y "56eb027d65b4d2dce6cb2e2d32c4d4afc9e1d707" [];
        "slide@^1.1.6" = s."slide@1.1.6";
        "slide@~1.1.3" = s."slide@1.1.6";
        "slide@~1.1.6" = s."slide@1.1.6";
        "smart-buffer@4.1.0" = f "smart-buffer" "4.1.0" y "91605c25d91652f4661ea69ccf45f1b331ca21ba" [];
        "smart-buffer@^4.1.0" = s."smart-buffer@4.1.0";
        "snapdragon-node@2.1.1" = f "snapdragon-node" "2.1.1" y "6c175f86ff14bdb0724563e8f3c1b021a286853b" [
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.0")
          (s."snapdragon-util@^3.0.1")
          ];
        "snapdragon-node@^2.0.1" = s."snapdragon-node@2.1.1";
        "snapdragon-util@3.0.1" = f "snapdragon-util" "3.0.1" y "f956479486f2acd79700693f6f7b805e45ab56e2" [
          (s."kind-of@^3.2.0")
          ];
        "snapdragon-util@^3.0.1" = s."snapdragon-util@3.0.1";
        "snapdragon@0.8.2" = f "snapdragon" "0.8.2" y "64922e7c565b0e14204ba1aa7d6964278d25182d" [
          (s."base@^0.11.1")
          (s."debug@^2.2.0")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."map-cache@^0.2.2")
          (s."source-map@^0.5.6")
          (s."source-map-resolve@^0.5.0")
          (s."use@^3.1.0")
          ];
        "snapdragon@^0.8.1" = s."snapdragon@0.8.2";
        "socks-proxy-agent@4.0.2" = f "socks-proxy-agent" "4.0.2" y "3c8991f3145b2799e70e11bd5fbc8b1963116386" [
          (s."agent-base@~4.2.1")
          (s."socks@~2.3.2")
          ];
        "socks-proxy-agent@^4.0.0" = s."socks-proxy-agent@4.0.2";
        "socks@2.3.3" = f "socks" "2.3.3" y "01129f0a5d534d2b897712ed8aceab7ee65d78e3" [
          (s."ip@1.1.5")
          (s."smart-buffer@^4.1.0")
          ];
        "socks@~2.3.2" = s."socks@2.3.3";
        "sorted-object@2.0.1" = f "sorted-object" "2.0.1" y "7d631f4bd3a798a24af1dffcfbfe83337a5df5fc" [];
        "sorted-object@~2.0.1" = s."sorted-object@2.0.1";
        "sorted-union-stream@2.1.3" = f "sorted-union-stream" "2.1.3" y "c7794c7e077880052ff71a8d4a2dbb4a9a638ac7" [
          (s."from2@^1.3.0")
          (s."stream-iterate@^1.1.0")
          ];
        "sorted-union-stream@~2.1.3" = s."sorted-union-stream@2.1.3";
        "source-list-map@2.0.1" = f "source-list-map" "2.0.1" y "3993bd873bfc48479cca9ea3a547835c7c154b34" [];
        "source-list-map@^2.0.0" = s."source-list-map@2.0.1";
        "source-map-resolve@0.5.3" = f "source-map-resolve" "0.5.3" y "190866bece7553e1f8f267a2ee82c606b5509a1a" [
          (s."atob@^2.1.2")
          (s."decode-uri-component@^0.2.0")
          (s."resolve-url@^0.2.1")
          (s."source-map-url@^0.4.0")
          (s."urix@^0.1.0")
          ];
        "source-map-resolve@^0.5.0" = s."source-map-resolve@0.5.3";
        "source-map-support@0.4.18" = f "source-map-support" "0.4.18" y "0286a6de8be42641338594e97ccea75f0a2c585f" [
          (s."source-map@^0.5.6")
          ];
        "source-map-support@0.5.12" = f "source-map-support" "0.5.12" y "b4f3b10d51857a5af0138d3ce8003b201613d599" [
          (s."buffer-from@^1.0.0")
          (s."source-map@^0.6.0")
          ];
        "source-map-support@^0.4.15" = s."source-map-support@0.4.18";
        "source-map-support@~0.5.12" = s."source-map-support@0.5.12";
        "source-map-url@0.4.0" = f "source-map-url" "0.4.0" y "3e935d7ddd73631b97659956d55128e87b5084a3" [];
        "source-map-url@^0.4.0" = s."source-map-url@0.4.0";
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@^0.5.6" = s."source-map@0.5.7";
        "source-map@^0.5.7" = s."source-map@0.5.7";
        "source-map@^0.6.0" = s."source-map@0.6.1";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "source-map@~0.6.1" = s."source-map@0.6.1";
        "spawn-error-forwarder@1.0.0" = f "spawn-error-forwarder" "1.0.0" y "1afd94738e999b0346d7b9fc373be55e07577029" [];
        "spawn-error-forwarder@~1.0.0" = s."spawn-error-forwarder@1.0.0";
        "spdx-correct@3.0.0" = f "spdx-correct" "3.0.0" y "05a5b4d7153a195bc92c3c425b69f3b2a9524c82" [
          (s."spdx-expression-parse@^3.0.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-correct@^3.0.0" = s."spdx-correct@3.0.0";
        "spdx-exceptions@2.1.0" = f "spdx-exceptions" "2.1.0" y "2c7ae61056c714a5b9b9b2b2af7d311ef5c78fe9" [];
        "spdx-exceptions@^2.1.0" = s."spdx-exceptions@2.1.0";
        "spdx-expression-parse@3.0.0" = f "spdx-expression-parse" "3.0.0" y "99e119b7a5da00e05491c9fa338b7904823b41d0" [
          (s."spdx-exceptions@^2.1.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-expression-parse@^3.0.0" = s."spdx-expression-parse@3.0.0";
        "spdx-license-ids@3.0.5" = f "spdx-license-ids" "3.0.5" y "3694b5804567a458d3c8045842a6358632f62654" [];
        "spdx-license-ids@^3.0.0" = s."spdx-license-ids@3.0.5";
        "split-on-first@1.1.0" = f "split-on-first" "1.1.0" y "f610afeee3b12bce1d0c30425e76398b78249a5f" [];
        "split-on-first@^1.0.0" = s."split-on-first@1.1.0";
        "split-string@3.1.0" = f "split-string" "3.1.0" y "7cb09dda3a86585705c64b39a6466038682e8fe2" [
          (s."extend-shallow@^3.0.0")
          ];
        "split-string@^3.0.1" = s."split-string@3.1.0";
        "split-string@^3.0.2" = s."split-string@3.1.0";
        "split2@1.0.0" = f "split2" "1.0.0" y "52e2e221d88c75f9a73f90556e263ff96772b314" [
          (s."through2@~2.0.0")
          ];
        "split2@2.2.0" = f "split2" "2.2.0" y "186b2575bcf83e85b7d18465756238ee4ee42493" [
          (s."through2@^2.0.2")
          ];
        "split2@^2.0.0" = s."split2@2.2.0";
        "split2@~1.0.0" = s."split2@1.0.0";
        "split@1.0.1" = f "split" "1.0.1" y "605bd9be303aa59fb35f9229fbea0ddec9ea07d9" [
          (s."through@2")
          ];
        "split@^1.0.0" = s."split@1.0.1";
        "sshpk@1.16.1" = f "sshpk" "1.16.1" y "fb661c0bef29b39db40769ee39fa70093d6f6877" [
          (s."asn1@~0.2.3")
          (s."assert-plus@^1.0.0")
          (s."bcrypt-pbkdf@^1.0.0")
          (s."dashdash@^1.12.0")
          (s."ecc-jsbn@~0.1.1")
          (s."getpass@^0.1.1")
          (s."jsbn@~0.1.0")
          (s."safer-buffer@^2.0.2")
          (s."tweetnacl@~0.14.0")
          ];
        "sshpk@^1.7.0" = s."sshpk@1.16.1";
        "ssri@6.0.1" = f "ssri" "6.0.1" y "2a3c41b28dd45b62b63676ecb74001265ae9edd8" [
          (s."figgy-pudding@^3.5.1")
          ];
        "ssri@^6.0.0" = s."ssri@6.0.1";
        "ssri@^6.0.1" = s."ssri@6.0.1";
        "static-extend@0.1.2" = f "static-extend" "0.1.2" y "60809c39cbff55337226fd5e0b520f341f1fb5c6" [
          (s."define-property@^0.2.5")
          (s."object-copy@^0.1.0")
          ];
        "static-extend@^0.1.1" = s."static-extend@0.1.2";
        "statuses@1.5.0" = f "statuses" "1.5.0" y "161c7dac177659fd9811f43771fa99381478628c" [];
        "statuses@>= 1.5.0 < 2" = s."statuses@1.5.0";
        "statuses@~1.5.0" = s."statuses@1.5.0";
        "stream-browserify@2.0.2" = f "stream-browserify" "2.0.2" y "87521d38a44aa7ee91ce1cd2a47df0cb49dd660b" [
          (s."inherits@~2.0.1")
          (s."readable-stream@^2.0.2")
          ];
        "stream-browserify@^2.0.1" = s."stream-browserify@2.0.2";
        "stream-combiner2@1.1.1" = f "stream-combiner2" "1.1.1" y "fb4d8a1420ea362764e21ad4780397bebcb41cbe" [
          (s."duplexer2@~0.1.0")
          (s."readable-stream@^2.0.2")
          ];
        "stream-combiner2@~1.1.1" = s."stream-combiner2@1.1.1";
        "stream-each@1.2.2" = f "stream-each" "1.2.2" y "8e8c463f91da8991778765873fe4d960d8f616bd" [
          (s."end-of-stream@^1.1.0")
          (s."stream-shift@^1.0.0")
          ];
        "stream-each@^1.1.0" = s."stream-each@1.2.2";
        "stream-http@2.8.3" = f "stream-http" "2.8.3" y "b2d242469288a5a27ec4fe8933acf623de6514fc" [
          (s."builtin-status-codes@^3.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.3.6")
          (s."to-arraybuffer@^1.0.0")
          (s."xtend@^4.0.0")
          ];
        "stream-http@^2.7.2" = s."stream-http@2.8.3";
        "stream-iterate@1.2.0" = f "stream-iterate" "1.2.0" y "2bd7c77296c1702a46488b8ad41f79865eecd4e1" [
          (s."readable-stream@^2.1.5")
          (s."stream-shift@^1.0.0")
          ];
        "stream-iterate@^1.1.0" = s."stream-iterate@1.2.0";
        "stream-shift@1.0.0" = f "stream-shift" "1.0.0" y "d5c752825e5367e786f78e18e445ea223a155952" [];
        "stream-shift@^1.0.0" = s."stream-shift@1.0.0";
        "stream-to-pull-stream@1.7.3" = f "stream-to-pull-stream" "1.7.3" y "4161aa2d2eb9964de60bfa1af7feaf917e874ece" [
          (s."looper@^3.0.0")
          (s."pull-stream@^3.2.3")
          ];
        "stream-to-pull-stream@^1.7.1" = s."stream-to-pull-stream@1.7.3";
        "strict-uri-encode@1.1.0" = f "strict-uri-encode" "1.1.0" y "279b225df1d582b1f54e65addd4352e18faa0713" [];
        "strict-uri-encode@2.0.0" = f "strict-uri-encode" "2.0.0" y "b9c7330c7042862f6b142dc274bbcc5866ce3546" [];
        "strict-uri-encode@^1.0.0" = s."strict-uri-encode@1.1.0";
        "strict-uri-encode@^2.0.0" = s."strict-uri-encode@2.0.0";
        "string-width@1.0.2" = f "string-width" "1.0.2" y "118bdf5b8cdc51a2a7e70d211e07e2b0b9b107d3" [
          (s."code-point-at@^1.0.0")
          (s."is-fullwidth-code-point@^1.0.0")
          (s."strip-ansi@^3.0.0")
          ];
        "string-width@2.1.1" = f "string-width" "2.1.1" y "ab93f27a8dc13d28cac815c462143a6d9012ae9e" [
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^4.0.0")
          ];
        "string-width@3.1.0" = f "string-width" "3.1.0" y "22767be21b62af1081574306f69ac51b62203961" [
          (s."emoji-regex@^7.0.1")
          (s."is-fullwidth-code-point@^2.0.0")
          (s."strip-ansi@^5.1.0")
          ];
        "string-width@4.2.0" = f "string-width" "4.2.0" y "952182c46cc7b2c313d1596e623992bd163b72b5" [
          (s."emoji-regex@^8.0.0")
          (s."is-fullwidth-code-point@^3.0.0")
          (s."strip-ansi@^6.0.0")
          ];
        "string-width@^1.0.1" = s."string-width@1.0.2";
        "string-width@^1.0.2" = s."string-width@1.0.2";
        "string-width@^2.0.0" = s."string-width@2.1.1";
        "string-width@^2.1.1" = s."string-width@2.1.1";
        "string-width@^3.0.0" = s."string-width@3.1.0";
        "string-width@^3.1.0" = s."string-width@3.1.0";
        "string-width@^4.1.0" = s."string-width@4.2.0";
        "string-width@^4.2.0" = s."string-width@4.2.0";
        "string.prototype.trim@1.2.2" = f "string.prototype.trim" "1.2.2" y "f538d0bacd98fc4297f0bef645226d5aaebf59f3" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.18.0-next.0")
          ];
        "string.prototype.trim@~1.2.1" = s."string.prototype.trim@1.2.2";
        "string.prototype.trimend@1.0.1" = f "string.prototype.trimend" "1.0.1" y "85812a6b847ac002270f5808146064c995fb6913" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.5")
          ];
        "string.prototype.trimend@^1.0.1" = s."string.prototype.trimend@1.0.1";
        "string.prototype.trimstart@1.0.1" = f "string.prototype.trimstart" "1.0.1" y "14af6d9f34b053f7cfc89b72f8f2ee14b9039a54" [
          (s."define-properties@^1.1.3")
          ];
        "string.prototype.trimstart@^1.0.1" = s."string.prototype.trimstart@1.0.1";
        "string_decoder@0.10.31" = f "string_decoder" "0.10.31" y "62e203bc41766c6c28c9fc84301dab1c5310fa94" [];
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@1.3.0" = f "string_decoder" "1.3.0" y "42f114594a46cf1a8e30b0a84f56c78c3edac21e" [
          (s."safe-buffer@~5.2.0")
          ];
        "string_decoder@^1.0.0" = s."string_decoder@1.3.0";
        "string_decoder@^1.1.1" = s."string_decoder@1.1.1";
        "string_decoder@~0.10.x" = s."string_decoder@0.10.31";
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "stringify-package@1.0.1" = f "stringify-package" "1.0.1" y "e5aa3643e7f74d0f28628b72f3dad5cecfc3ba85" [];
        "stringify-package@^1.0.0" = s."stringify-package@1.0.1";
        "stringify-package@^1.0.1" = s."stringify-package@1.0.1";
        "strip-ansi@3.0.1" = f "strip-ansi" "3.0.1" y "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf" [
          (s."ansi-regex@^2.0.0")
          ];
        "strip-ansi@4.0.0" = f "strip-ansi" "4.0.0" y "a8479022eb1ac368a871389b635262c505ee368f" [
          (s."ansi-regex@^3.0.0")
          ];
        "strip-ansi@5.2.0" = f "strip-ansi" "5.2.0" y "8c9a536feb6afc962bdfa5b104a5091c1ad9c0ae" [
          (s."ansi-regex@^4.1.0")
          ];
        "strip-ansi@6.0.0" = f "strip-ansi" "6.0.0" y "0b1571dd7669ccd4f3e06e14ef1eed26225ae532" [
          (s."ansi-regex@^5.0.0")
          ];
        "strip-ansi@^3.0.0" = s."strip-ansi@3.0.1";
        "strip-ansi@^3.0.1" = s."strip-ansi@3.0.1";
        "strip-ansi@^4.0.0" = s."strip-ansi@4.0.0";
        "strip-ansi@^5.0.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^5.1.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^5.2.0" = s."strip-ansi@5.2.0";
        "strip-ansi@^6.0.0" = s."strip-ansi@6.0.0";
        "strip-bom@3.0.0" = f "strip-bom" "3.0.0" y "2334c18e9c759f7bdd56fdef7e9ae3d588e68ed3" [];
        "strip-bom@^3.0.0" = s."strip-bom@3.0.0";
        "strip-eof@1.0.0" = f "strip-eof" "1.0.0" y "bb43ff5598a6eb05d89b59fcd129c983313606bf" [];
        "strip-eof@^1.0.0" = s."strip-eof@1.0.0";
        "strip-final-newline@2.0.0" = f "strip-final-newline" "2.0.0" y "89b852fb2fcbe936f6f4b3187afb0a12c1ab58ad" [];
        "strip-final-newline@^2.0.0" = s."strip-final-newline@2.0.0";
        "strip-hex-prefix@1.0.0" = f "strip-hex-prefix" "1.0.0" y "0c5f155fef1151373377de9dbb588da05500e36f" [
          (s."is-hex-prefixed@1.0.0")
          ];
        "strip-indent@3.0.0" = f "strip-indent" "3.0.0" y "c32e1cee940b6b3432c771bc2c54bcce73cd3001" [
          (s."min-indent@^1.0.0")
          ];
        "strip-indent@^3.0.0" = s."strip-indent@3.0.0";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@~2.0.1" = s."strip-json-comments@2.0.1";
        "supports-color@2.0.0" = f "supports-color" "2.0.0" y "535d045ce6b6363fa40117084629995e9df324c7" [];
        "supports-color@5.4.0" = f "supports-color" "5.4.0" y "1c6b337402c2137605efe19f10fec390f6faab54" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@6.1.0" = f "supports-color" "6.1.0" y "0764abc69c63d5ac842dd4867e8d025e880df8f3" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@7.2.0" = f "supports-color" "7.2.0" y "1b7dcdcb32b8138801b3e478ba6a51caa89648da" [
          (s."has-flag@^4.0.0")
          ];
        "supports-color@^2.0.0" = s."supports-color@2.0.0";
        "supports-color@^5.3.0" = s."supports-color@5.4.0";
        "supports-color@^6.1.0" = s."supports-color@6.1.0";
        "supports-color@^7.0.0" = s."supports-color@7.2.0";
        "supports-color@^7.1.0" = s."supports-color@7.2.0";
        "supports-hyperlinks@2.1.0" = f "supports-hyperlinks" "2.1.0" y "f663df252af5f37c5d49bbd7eeefa9e0b9e59e47" [
          (s."has-flag@^4.0.0")
          (s."supports-color@^7.0.0")
          ];
        "supports-hyperlinks@^2.1.0" = s."supports-hyperlinks@2.1.0";
        "swarm-js@0.1.40" = f "swarm-js" "0.1.40" y "b1bc7b6dcc76061f6c772203e004c11997e06b99" [
          (s."bluebird@^3.5.0")
          (s."buffer@^5.0.5")
          (s."eth-lib@^0.1.26")
          (s."fs-extra@^4.0.2")
          (s."got@^7.1.0")
          (s."mime-types@^2.1.16")
          (s."mkdirp-promise@^5.0.1")
          (s."mock-fs@^4.1.0")
          (s."setimmediate@^1.0.5")
          (s."tar@^4.0.2")
          (s."xhr-request@^1.0.1")
          ];
        "swarm-js@^0.1.40" = s."swarm-js@0.1.40";
        "tapable@1.1.3" = f "tapable" "1.1.3" y "a1fccc06b58db61fd7a45da2da44f5f3a3e67ba2" [];
        "tapable@^1.0.0" = s."tapable@1.1.3";
        "tapable@^1.1.3" = s."tapable@1.1.3";
        "tape@4.13.3" = f "tape" "4.13.3" y "51b3d91c83668c7a45b1a594b607dee0a0b46278" [
          (s."deep-equal@~1.1.1")
          (s."defined@~1.0.0")
          (s."dotignore@~0.1.2")
          (s."for-each@~0.3.3")
          (s."function-bind@~1.1.1")
          (s."glob@~7.1.6")
          (s."has@~1.0.3")
          (s."inherits@~2.0.4")
          (s."is-regex@~1.0.5")
          (s."minimist@~1.2.5")
          (s."object-inspect@~1.7.0")
          (s."resolve@~1.17.0")
          (s."resumer@~0.0.0")
          (s."string.prototype.trim@~1.2.1")
          (s."through@~2.3.8")
          ];
        "tape@^4.6.3" = s."tape@4.13.3";
        "tar@4.4.13" = f "tar" "4.4.13" y "43b364bc52888d555298637b10d60790254ab525" [
          (s."chownr@^1.1.1")
          (s."fs-minipass@^1.2.5")
          (s."minipass@^2.8.6")
          (s."minizlib@^1.2.1")
          (s."mkdirp@^0.5.0")
          (s."safe-buffer@^5.1.2")
          (s."yallist@^3.0.3")
          ];
        "tar@^4.0.2" = s."tar@4.4.13";
        "tar@^4.4.10" = s."tar@4.4.13";
        "tar@^4.4.12" = s."tar@4.4.13";
        "tar@^4.4.13" = s."tar@4.4.13";
        "temp-dir@2.0.0" = f "temp-dir" "2.0.0" y "bde92b05bdfeb1516e804c9c00ad45177f31321e" [];
        "temp-dir@^2.0.0" = s."temp-dir@2.0.0";
        "tempy@0.5.0" = f "tempy" "0.5.0" y "2785c89df39fcc4d1714fc554813225e1581d70b" [
          (s."is-stream@^2.0.0")
          (s."temp-dir@^2.0.0")
          (s."type-fest@^0.12.0")
          (s."unique-string@^2.0.0")
          ];
        "tempy@^0.5.0" = s."tempy@0.5.0";
        "term-size@1.2.0" = f "term-size" "1.2.0" y "458b83887f288fc56d6fffbfad262e26638efa69" [
          (s."execa@^0.7.0")
          ];
        "term-size@^1.2.0" = s."term-size@1.2.0";
        "terser-webpack-plugin@1.4.5" = f "terser-webpack-plugin" "1.4.5" y "a217aefaea330e734ffacb6120ec1fa312d6040b" [
          (s."cacache@^12.0.2")
          (s."find-cache-dir@^2.1.0")
          (s."is-wsl@^1.1.0")
          (s."schema-utils@^1.0.0")
          (s."serialize-javascript@^4.0.0")
          (s."source-map@^0.6.1")
          (s."terser@^4.1.2")
          (s."webpack-sources@^1.4.0")
          (s."worker-farm@^1.7.0")
          ];
        "terser-webpack-plugin@^1.4.3" = s."terser-webpack-plugin@1.4.5";
        "terser@4.8.0" = f "terser" "4.8.0" y "63056343d7c70bb29f3af665865a46fe03a0df17" [
          (s."commander@^2.20.0")
          (s."source-map@~0.6.1")
          (s."source-map-support@~0.5.12")
          ];
        "terser@^4.1.2" = s."terser@4.8.0";
        "text-extensions@1.9.0" = f "text-extensions" "1.9.0" y "1853e45fee39c945ce6f6c36b2d659b5aabc2a26" [];
        "text-extensions@^1.0.0" = s."text-extensions@1.9.0";
        "text-table@0.2.0" = f "text-table" "0.2.0" y "7f5ee823ae805207c00af2df4a84ec3fcfa570b4" [];
        "text-table@~0.2.0" = s."text-table@0.2.0";
        "thirty-two@1.0.2" = f "thirty-two" "1.0.2" y "4ca2fffc02a51290d2744b9e3f557693ca6b627a" [];
        "through2@2.0.3" = f "through2" "2.0.3" y "0004569b37c7c74ba39c43f3ced78d1ad94140be" [
          (s."readable-stream@^2.1.5")
          (s."xtend@~4.0.1")
          ];
        "through2@2.0.5" = f "through2" "2.0.5" y "01c1e39eb31d07cb7d03a96a70823260b23132cd" [
          (s."readable-stream@~2.3.6")
          (s."xtend@~4.0.1")
          ];
        "through2@3.0.2" = f "through2" "3.0.2" y "99f88931cfc761ec7678b41d5d7336b5b6a07bf4" [
          (s."inherits@^2.0.4")
          (s."readable-stream@2 || 3")
          ];
        "through2@^2.0.0" = s."through2@2.0.3";
        "through2@^2.0.2" = s."through2@2.0.5";
        "through2@^2.0.3" = s."through2@2.0.5";
        "through2@^3.0.0" = s."through2@3.0.2";
        "through2@~2.0.0" = s."through2@2.0.5";
        "through@2" = s."through@2.3.8";
        "through@2.3.8" = f "through" "2.3.8" y "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5" [];
        "through@>=2.2.7 <3" = s."through@2.3.8";
        "through@~2.3.4" = s."through@2.3.8";
        "through@~2.3.8" = s."through@2.3.8";
        "timed-out@4.0.1" = f "timed-out" "4.0.1" y "f32eacac5a175bea25d7fab565ab3ed8741ef56f" [];
        "timed-out@^4.0.0" = s."timed-out@4.0.1";
        "timed-out@^4.0.1" = s."timed-out@4.0.1";
        "timers-browserify@2.0.11" = f "timers-browserify" "2.0.11" y "800b1f3eee272e5bc53ee465a04d0e804c31211f" [
          (s."setimmediate@^1.0.4")
          ];
        "timers-browserify@^2.0.4" = s."timers-browserify@2.0.11";
        "tiny-relative-date@1.3.0" = f "tiny-relative-date" "1.3.0" y "fa08aad501ed730f31cc043181d995c39a935e07" [];
        "tiny-relative-date@^1.3.0" = s."tiny-relative-date@1.3.0";
        "tmp@0.0.31" = f "tmp" "0.0.31" y "8f38ab9438e17315e5dbd8b3657e8bfb277ae4a7" [
          (s."os-tmpdir@~1.0.1")
          ];
        "tmp@0.0.33" = f "tmp" "0.0.33" y "6d34335889768d21b2bcda0aa277ced3b1bfadf9" [
          (s."os-tmpdir@~1.0.2")
          ];
        "tmp@0.1.0" = f "tmp" "0.1.0" y "ee434a4e22543082e294ba6201dcc6eafefa2877" [
          (s."rimraf@^2.6.3")
          ];
        "tmp@^0.0.33" = s."tmp@0.0.33";
        "to-arraybuffer@1.0.1" = f "to-arraybuffer" "1.0.1" y "7d229b1fcc637e466ca081180836a7aabff83f43" [];
        "to-arraybuffer@^1.0.0" = s."to-arraybuffer@1.0.1";
        "to-fast-properties@1.0.3" = f "to-fast-properties" "1.0.3" y "b83571fa4d8c25b82e231b06e3a3055de4ca1a47" [];
        "to-fast-properties@^1.0.3" = s."to-fast-properties@1.0.3";
        "to-object-path@0.3.0" = f "to-object-path" "0.3.0" y "297588b7b0e7e0ac08e04e672f85c1f4999e17af" [
          (s."kind-of@^3.0.2")
          ];
        "to-object-path@^0.3.0" = s."to-object-path@0.3.0";
        "to-readable-stream@1.0.0" = f "to-readable-stream" "1.0.0" y "ce0aa0c2f3df6adf852efb404a783e77c0475771" [];
        "to-readable-stream@^1.0.0" = s."to-readable-stream@1.0.0";
        "to-regex-range@2.1.1" = f "to-regex-range" "2.1.1" y "7c80c17b9dfebe599e27367e0d4dd5590141db38" [
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          ];
        "to-regex-range@5.0.1" = f "to-regex-range" "5.0.1" y "1648c44aae7c8d988a326018ed72f5b4dd0392e4" [
          (s."is-number@^7.0.0")
          ];
        "to-regex-range@^2.1.0" = s."to-regex-range@2.1.1";
        "to-regex-range@^5.0.1" = s."to-regex-range@5.0.1";
        "to-regex@3.0.2" = f "to-regex" "3.0.2" y "13cfdd9b336552f30b51f33a8ae1b42a7a7599ce" [
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."regex-not@^1.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "to-regex@^3.0.1" = s."to-regex@3.0.2";
        "to-regex@^3.0.2" = s."to-regex@3.0.2";
        "toidentifier@1.0.0" = f "toidentifier" "1.0.0" y "7e1be3470f1e77948bc43d94a3c8f4d7752ba553" [];
        "tough-cookie@2.4.3" = f "tough-cookie" "2.4.3" y "53f36da3f47783b0925afa06ff9f3b165280f781" [
          (s."psl@^1.1.24")
          (s."punycode@^1.4.1")
          ];
        "tough-cookie@2.5.0" = f "tough-cookie" "2.5.0" y "cd9fb2a0aa1d5a12b473bd9fb96fa3dcff65ade2" [
          (s."psl@^1.1.28")
          (s."punycode@^2.1.1")
          ];
        "tough-cookie@~2.4.3" = s."tough-cookie@2.4.3";
        "tough-cookie@~2.5.0" = s."tough-cookie@2.5.0";
        "traverse@0.6.6" = f "traverse" "0.6.6" y "cbdf560fd7b9af632502fed40f918c157ea97137" [];
        "traverse@~0.6.6" = s."traverse@0.6.6";
        "trim-newlines@3.0.0" = f "trim-newlines" "3.0.0" y "79726304a6a898aa8373427298d54c2ee8b1cb30" [];
        "trim-newlines@^3.0.0" = s."trim-newlines@3.0.0";
        "trim-off-newlines@1.0.1" = f "trim-off-newlines" "1.0.1" y "9f9ba9d9efa8764c387698bcbfeb2c848f11adb3" [];
        "trim-off-newlines@^1.0.0" = s."trim-off-newlines@1.0.1";
        "trim-right@1.0.1" = f "trim-right" "1.0.1" y "cb2e1203067e0c8de1f614094b9fe45704ea6003" [];
        "trim-right@^1.0.1" = s."trim-right@1.0.1";
        "tslib@1.13.0" = f "tslib" "1.13.0" y "c881e13cc7015894ed914862d276436fa9a47043" [];
        "tslib@^1.9.0" = s."tslib@1.13.0";
        "tty-browserify@0.0.0" = f "tty-browserify" "0.0.0" y "a157ba402da24e9bf957f9aa69d524eed42901a6" [];
        "tunnel-agent@0.6.0" = f "tunnel-agent" "0.6.0" y "27a5dea06b36b04a0a9966774b290868f0fc40fd" [
          (s."safe-buffer@^5.0.1")
          ];
        "tunnel-agent@^0.6.0" = s."tunnel-agent@0.6.0";
        "tweetnacl-util@0.15.1" = f "tweetnacl-util" "0.15.1" y "b80fcdb5c97bcc508be18c44a4be50f022eea00b" [];
        "tweetnacl-util@^0.15.0" = s."tweetnacl-util@0.15.1";
        "tweetnacl@0.14.5" = f "tweetnacl" "0.14.5" y "5ae68177f192d4456269d108afa93ff8743f4f64" [];
        "tweetnacl@1.0.3" = f "tweetnacl" "1.0.3" y "ac0af71680458d8a6378d0d0d050ab1407d35596" [];
        "tweetnacl@^0.14.3" = s."tweetnacl@0.14.5";
        "tweetnacl@^1.0.0" = s."tweetnacl@1.0.3";
        "tweetnacl@~0.14.0" = s."tweetnacl@0.14.5";
        "type-fest@0.11.0" = f "type-fest" "0.11.0" y "97abf0872310fed88a5c466b25681576145e33f1" [];
        "type-fest@0.12.0" = f "type-fest" "0.12.0" y "f57a27ab81c68d136a51fd71467eff94157fa1ee" [];
        "type-fest@0.13.1" = f "type-fest" "0.13.1" y "0172cb5bce80b0bd542ea348db50c7e21834d934" [];
        "type-fest@0.6.0" = f "type-fest" "0.6.0" y "8d2a2370d3df886eb5c90ada1c5bf6188acf838b" [];
        "type-fest@0.8.1" = f "type-fest" "0.8.1" y "09e249ebde851d3b1e48d27c105444667f17b83d" [];
        "type-fest@^0.11.0" = s."type-fest@0.11.0";
        "type-fest@^0.12.0" = s."type-fest@0.12.0";
        "type-fest@^0.13.1" = s."type-fest@0.13.1";
        "type-fest@^0.6.0" = s."type-fest@0.6.0";
        "type-fest@^0.8.1" = s."type-fest@0.8.1";
        "type-is@1.6.18" = f "type-is" "1.6.18" y "4e552cd05df09467dcbc4ef739de89f2cf37c131" [
          (s."media-typer@0.3.0")
          (s."mime-types@~2.1.24")
          ];
        "type-is@~1.6.17" = s."type-is@1.6.18";
        "type-is@~1.6.18" = s."type-is@1.6.18";
        "type@1.2.0" = f "type" "1.2.0" y "848dd7698dafa3e54a6c479e759c4bc3f18847a0" [];
        "type@2.1.0" = f "type" "2.1.0" y "9bdc22c648cf8cf86dd23d32336a41cfb6475e3f" [];
        "type@^1.0.1" = s."type@1.2.0";
        "type@^2.0.0" = s."type@2.1.0";
        "typedarray-to-buffer@3.1.5" = f "typedarray-to-buffer" "3.1.5" y "a97ee7a9ff42691b9f783ff1bc5112fe3fca9080" [
          (s."is-typedarray@^1.0.0")
          ];
        "typedarray-to-buffer@^3.1.5" = s."typedarray-to-buffer@3.1.5";
        "typedarray@0.0.6" = f "typedarray" "0.0.6" y "867ac74e3864187b1d3d47d996a78ec5c8830777" [];
        "typedarray@^0.0.6" = s."typedarray@0.0.6";
        "typewise-core@1.2.0" = f "typewise-core" "1.2.0" y "97eb91805c7f55d2f941748fa50d315d991ef195" [];
        "typewise-core@^1.2" = s."typewise-core@1.2.0";
        "typewise-core@^1.2.0" = s."typewise-core@1.2.0";
        "typewise@1.0.3" = f "typewise" "1.0.3" y "1067936540af97937cc5dcf9922486e9fa284651" [
          (s."typewise-core@^1.2.0")
          ];
        "typewise@^1.0.3" = s."typewise@1.0.3";
        "typewiselite@1.0.0" = f "typewiselite" "1.0.0" y "c8882fa1bb1092c06005a97f34ef5c8508e3664e" [];
        "typewiselite@~1.0.0" = s."typewiselite@1.0.0";
        "uglify-js@3.11.0" = f "uglify-js" "3.11.0" y "67317658d76c21e0e54d3224aee2df4ee6c3e1dc" [];
        "uglify-js@^3.1.4" = s."uglify-js@3.11.0";
        "uid-number@0.0.6" = f "uid-number" "0.0.6" y "0ea10e8035e8eb5b8e4449f06da1c730663baa81" [];
        "ultron@1.1.1" = f "ultron" "1.1.1" y "9fe1536a10a664a65266a1e3ccf85fd36302bc9c" [];
        "ultron@~1.1.0" = s."ultron@1.1.1";
        "umask@1.1.0" = f "umask" "1.1.0" y "f29cebf01df517912bb58ff9c4e50fde8e33320d" [];
        "umask@^1.1.0" = s."umask@1.1.0";
        "umask@~1.1.0" = s."umask@1.1.0";
        "underscore@1.9.1" = f "underscore" "1.9.1" y "06dce34a0e68a7babc29b365b8e74b8925203961" [];
        "union-value@1.0.1" = f "union-value" "1.0.1" y "0b6fe7b835aecda61c6ea4d4f02c14221e109847" [
          (s."arr-union@^3.1.0")
          (s."get-value@^2.0.6")
          (s."is-extendable@^0.1.1")
          (s."set-value@^2.0.1")
          ];
        "union-value@^1.0.0" = s."union-value@1.0.1";
        "unique-filename@1.1.1" = f "unique-filename" "1.1.1" y "1d69769369ada0583103a1e6ae87681b56573230" [
          (s."unique-slug@^2.0.0")
          ];
        "unique-filename@^1.1.1" = s."unique-filename@1.1.1";
        "unique-slug@2.0.0" = f "unique-slug" "2.0.0" y "db6676e7c7cc0629878ff196097c78855ae9f4ab" [
          (s."imurmurhash@^0.1.4")
          ];
        "unique-slug@^2.0.0" = s."unique-slug@2.0.0";
        "unique-string@1.0.0" = f "unique-string" "1.0.0" y "9e1057cca851abb93398f8b33ae187b99caec11a" [
          (s."crypto-random-string@^1.0.0")
          ];
        "unique-string@2.0.0" = f "unique-string" "2.0.0" y "39c6451f81afb2749de2b233e3f7c5e8843bd89d" [
          (s."crypto-random-string@^2.0.0")
          ];
        "unique-string@^1.0.0" = s."unique-string@1.0.0";
        "unique-string@^2.0.0" = s."unique-string@2.0.0";
        "universal-user-agent@5.0.0" = f "universal-user-agent" "5.0.0" y "a3182aa758069bf0e79952570ca757de3579c1d9" [
          (s."os-name@^3.1.0")
          ];
        "universal-user-agent@6.0.0" = f "universal-user-agent" "6.0.0" y "3381f8503b251c0d9cd21bc1de939ec9df5480ee" [];
        "universal-user-agent@^5.0.0" = s."universal-user-agent@5.0.0";
        "universal-user-agent@^6.0.0" = s."universal-user-agent@6.0.0";
        "universalify@0.1.2" = f "universalify" "0.1.2" y "b646f69be3942dabcecc9d6639c80dc105efaa66" [];
        "universalify@1.0.0" = f "universalify" "1.0.0" y "b61a1da173e8435b2fe3c67d29b9adf8594bd16d" [];
        "universalify@^0.1.0" = s."universalify@0.1.2";
        "universalify@^1.0.0" = s."universalify@1.0.0";
        "unorm@1.6.0" = f "unorm" "1.6.0" y "029b289661fba714f1a9af439eb51d9b16c205af" [];
        "unorm@^1.3.3" = s."unorm@1.6.0";
        "unpipe@1.0.0" = f "unpipe" "1.0.0" y "b2bf4ee8514aae6165b4817829d21b2ef49904ec" [];
        "unpipe@~1.0.0" = s."unpipe@1.0.0";
        "unset-value@1.0.0" = f "unset-value" "1.0.0" y "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559" [
          (s."has-value@^0.3.1")
          (s."isobject@^3.0.0")
          ];
        "unset-value@^1.0.0" = s."unset-value@1.0.0";
        "unzip-response@2.0.1" = f "unzip-response" "2.0.1" y "d2f0f737d16b0615e72a6935ed04214572d56f97" [];
        "unzip-response@^2.0.1" = s."unzip-response@2.0.1";
        "upath@1.2.0" = f "upath" "1.2.0" y "8f66dbcd55a883acdae4408af8b035a5044c1894" [];
        "upath@^1.1.1" = s."upath@1.2.0";
        "update-notifier@2.5.0" = f "update-notifier" "2.5.0" y "d0744593e13f161e406acb1d9408b72cad08aff6" [
          (s."boxen@^1.2.1")
          (s."chalk@^2.0.1")
          (s."configstore@^3.0.0")
          (s."import-lazy@^2.1.0")
          (s."is-ci@^1.0.10")
          (s."is-installed-globally@^0.1.0")
          (s."is-npm@^1.0.0")
          (s."latest-version@^3.0.0")
          (s."semver-diff@^2.0.0")
          (s."xdg-basedir@^3.0.0")
          ];
        "update-notifier@^2.3.0" = s."update-notifier@2.5.0";
        "update-notifier@^2.5.0" = s."update-notifier@2.5.0";
        "uri-js@4.4.0" = f "uri-js" "4.4.0" y "aa714261de793e8a82347a7bcc9ce74e86f28602" [
          (s."punycode@^2.1.0")
          ];
        "uri-js@^4.2.2" = s."uri-js@4.4.0";
        "urix@0.1.0" = f "urix" "0.1.0" y "da937f7a62e21fec1fd18d49b35c2935067a6c72" [];
        "urix@^0.1.0" = s."urix@0.1.0";
        "url-join@4.0.1" = f "url-join" "4.0.1" y "b642e21a2646808ffa178c4c5fda39844e12cde7" [];
        "url-join@^4.0.0" = s."url-join@4.0.1";
        "url-parse-lax@1.0.0" = f "url-parse-lax" "1.0.0" y "7af8f303645e9bd79a272e7a14ac68bc0609da73" [
          (s."prepend-http@^1.0.1")
          ];
        "url-parse-lax@3.0.0" = f "url-parse-lax" "3.0.0" y "16b5cafc07dbe3676c1b1999177823d6503acb0c" [
          (s."prepend-http@^2.0.0")
          ];
        "url-parse-lax@^1.0.0" = s."url-parse-lax@1.0.0";
        "url-parse-lax@^3.0.0" = s."url-parse-lax@3.0.0";
        "url-set-query@1.0.0" = f "url-set-query" "1.0.0" y "016e8cfd7c20ee05cafe7795e892bd0702faa339" [];
        "url-set-query@^1.0.0" = s."url-set-query@1.0.0";
        "url-to-options@1.0.1" = f "url-to-options" "1.0.1" y "1505a03a289a48cbd7a434efbaeec5055f5633a9" [];
        "url-to-options@^1.0.1" = s."url-to-options@1.0.1";
        "url@0.11.0" = f "url" "0.11.0" y "3838e97cfc60521eb73c525a8e55bfdd9e2e28f1" [
          (s."punycode@1.3.2")
          (s."querystring@0.2.0")
          ];
        "url@^0.11.0" = s."url@0.11.0";
        "use@3.1.1" = f "use" "3.1.1" y "d50c8cac79a19fbc20f2911f56eb973f4e10070f" [];
        "use@^3.1.0" = s."use@3.1.1";
        "utf-8-validate@5.0.2" = f "utf-8-validate" "5.0.2" y "63cfbccd85dc1f2b66cf7a1d0eebc08ed056bfb3" [
          (s."node-gyp-build@~3.7.0")
          ];
        "utf-8-validate@^5.0.2" = s."utf-8-validate@5.0.2";
        "utf8@3.0.0" = f "utf8" "3.0.0" y "f052eed1364d696e769ef058b183df88c87f69d1" [];
        "utf8@^3.0.0" = s."utf8@3.0.0";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@^1.0.1" = s."util-deprecate@1.0.2";
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "util-extend@1.0.3" = f "util-extend" "1.0.3" y "a7c216d267545169637b3b6edc6ca9119e2ff93f" [];
        "util-extend@^1.0.1" = s."util-extend@1.0.3";
        "util-promisify@2.1.0" = f "util-promisify" "2.1.0" y "3c2236476c4d32c5ff3c47002add7c13b9a82a53" [
          (s."object.getownpropertydescriptors@^2.0.3")
          ];
        "util-promisify@^2.1.0" = s."util-promisify@2.1.0";
        "util.promisify@1.0.1" = f "util.promisify" "1.0.1" y "6baf7774b80eeb0f7520d8b81d07982a59abbaee" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.2")
          (s."has-symbols@^1.0.1")
          (s."object.getownpropertydescriptors@^2.1.0")
          ];
        "util.promisify@^1.0.0" = s."util.promisify@1.0.1";
        "util@0.10.3" = f "util" "0.10.3" y "7afb1afe50805246489e3db7fe0ed379336ac0f9" [
          (s."inherits@2.0.1")
          ];
        "util@0.11.1" = f "util" "0.11.1" y "3236733720ec64bb27f6e26f421aaa2e1b588d61" [
          (s."inherits@2.0.3")
          ];
        "util@^0.11.0" = s."util@0.11.1";
        "utils-merge@1.0.1" = f "utils-merge" "1.0.1" y "9f95710f50a267947b2ccc124741c1028427e713" [];
        "uuid@3.3.2" = f "uuid" "3.3.2" y "1b4af4955eb3077c501c23872fc6513811587131" [];
        "uuid@3.3.3" = f "uuid" "3.3.3" y "4568f0216e78760ee1dbf3a4d2cf53e224112866" [];
        "uuid@^3.3.2" = s."uuid@3.3.3";
        "uuid@^3.3.3" = s."uuid@3.3.3";
        "v8-compile-cache@2.1.1" = f "v8-compile-cache" "2.1.1" y "54bc3cdd43317bca91e35dcaf305b1a7237de745" [];
        "v8-compile-cache@^2.1.1" = s."v8-compile-cache@2.1.1";
        "validate-npm-package-license@3.0.4" = f "validate-npm-package-license" "3.0.4" y "fc91f6b9c7ba15c857f4cb2c5defeec39d4f410a" [
          (s."spdx-correct@^3.0.0")
          (s."spdx-expression-parse@^3.0.0")
          ];
        "validate-npm-package-license@^3.0.1" = s."validate-npm-package-license@3.0.4";
        "validate-npm-package-license@^3.0.4" = s."validate-npm-package-license@3.0.4";
        "validate-npm-package-name@3.0.0" = f "validate-npm-package-name" "3.0.0" y "5fa912d81eb7d0c74afc140de7317f0ca7df437e" [
          (s."builtins@^1.0.3")
          ];
        "validate-npm-package-name@^3.0.0" = s."validate-npm-package-name@3.0.0";
        "validate-npm-package-name@~3.0.0" = s."validate-npm-package-name@3.0.0";
        "varint@5.0.2" = f "varint" "5.0.2" y "5b47f8a947eb668b848e034dcfa87d0ff8a7f7a4" [];
        "varint@^5.0.0" = s."varint@5.0.2";
        "vary@1.1.2" = f "vary" "1.1.2" y "2299f02c6ded30d4a5961b0b9f74524a18f634fc" [];
        "vary@^1" = s."vary@1.1.2";
        "vary@~1.1.2" = s."vary@1.1.2";
        "verror@1.10.0" = f "verror" "1.10.0" y "3a105ca17053af55d6e270c1f8288682e18da400" [
          (s."assert-plus@^1.0.0")
          (s."core-util-is@1.0.2")
          (s."extsprintf@^1.2.0")
          ];
        "vm-browserify@1.1.2" = f "vm-browserify" "1.1.2" y "78641c488b8e6ca91a75f511e7a3b32a86e5dda0" [];
        "vm-browserify@^1.0.1" = s."vm-browserify@1.1.2";
        "watchpack-chokidar2@2.0.0" = f "watchpack-chokidar2" "2.0.0" y "9948a1866cbbd6cb824dea13a7ed691f6c8ddff0" [
          (s."chokidar@^2.1.8")
          ];
        "watchpack-chokidar2@^2.0.0" = s."watchpack-chokidar2@2.0.0";
        "watchpack@1.7.4" = f "watchpack" "1.7.4" y "6e9da53b3c80bb2d6508188f5b200410866cd30b" [
          (s."graceful-fs@^4.1.2")
          (s."neo-async@^2.5.0")
          (s."chokidar@^3.4.1")
          (s."watchpack-chokidar2@^2.0.0")
          ];
        "watchpack@^1.6.1" = s."watchpack@1.7.4";
        "wcwidth@1.0.1" = f "wcwidth" "1.0.1" y "f0b0dcf915bc5ff1528afadb2c0e17b532da2fe8" [
          (s."defaults@^1.0.3")
          ];
        "wcwidth@^1.0.0" = s."wcwidth@1.0.1";
        "web3-bzz@1.2.11" = f "web3-bzz" "1.2.11" y "41bc19a77444bd5365744596d778b811880f707f" [
          (s."@types/node@^12.12.6")
          (s."got@9.6.0")
          (s."swarm-js@^0.1.40")
          (s."underscore@1.9.1")
          ];
        "web3-core-helpers@1.2.11" = f "web3-core-helpers" "1.2.11" y "84c681ed0b942c0203f3b324a245a127e8c67a99" [
          (s."underscore@1.9.1")
          (s."web3-eth-iban@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-core-method@1.2.11" = f "web3-core-method" "1.2.11" y "f880137d1507a0124912bf052534f168b8d8fbb6" [
          (s."@ethersproject/transactions@^5.0.0-beta.135")
          (s."underscore@1.9.1")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-promievent@1.2.11")
          (s."web3-core-subscriptions@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-core-promievent@1.2.11" = f "web3-core-promievent" "1.2.11" y "51fe97ca0ddec2f99bf8c3306a7a8e4b094ea3cf" [
          (s."eventemitter3@4.0.4")
          ];
        "web3-core-requestmanager@1.2.11" = f "web3-core-requestmanager" "1.2.11" y "fe6eb603fbaee18530293a91f8cf26d8ae28c45a" [
          (s."underscore@1.9.1")
          (s."web3-core-helpers@1.2.11")
          (s."web3-providers-http@1.2.11")
          (s."web3-providers-ipc@1.2.11")
          (s."web3-providers-ws@1.2.11")
          ];
        "web3-core-subscriptions@1.2.11" = f "web3-core-subscriptions" "1.2.11" y "beca908fbfcb050c16f45f3f0f4c205e8505accd" [
          (s."eventemitter3@4.0.4")
          (s."underscore@1.9.1")
          (s."web3-core-helpers@1.2.11")
          ];
        "web3-core@1.2.11" = f "web3-core" "1.2.11" y "1043cacc1becb80638453cc5b2a14be9050288a7" [
          (s."@types/bn.js@^4.11.5")
          (s."@types/node@^12.12.6")
          (s."bignumber.js@^9.0.0")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-core-requestmanager@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-abi@1.2.11" = f "web3-eth-abi" "1.2.11" y "a887494e5d447c2926d557a3834edd66e17af9b0" [
          (s."@ethersproject/abi@5.0.0-beta.153")
          (s."underscore@1.9.1")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-accounts@1.2.11" = f "web3-eth-accounts" "1.2.11" y "a9e3044da442d31903a7ce035a86d8fa33f90520" [
          (s."crypto-browserify@3.12.0")
          (s."eth-lib@0.2.8")
          (s."ethereumjs-common@^1.3.2")
          (s."ethereumjs-tx@^2.1.1")
          (s."scrypt-js@^3.0.1")
          (s."underscore@1.9.1")
          (s."uuid@3.3.2")
          (s."web3-core@1.2.11")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-contract@1.2.11" = f "web3-eth-contract" "1.2.11" y "917065902bc27ce89da9a1da26e62ef663663b90" [
          (s."@types/bn.js@^4.11.5")
          (s."underscore@1.9.1")
          (s."web3-core@1.2.11")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-core-promievent@1.2.11")
          (s."web3-core-subscriptions@1.2.11")
          (s."web3-eth-abi@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-ens@1.2.11" = f "web3-eth-ens" "1.2.11" y "26d4d7f16d6cbcfff918e39832b939edc3162532" [
          (s."content-hash@^2.5.2")
          (s."eth-ens-namehash@2.0.8")
          (s."underscore@1.9.1")
          (s."web3-core@1.2.11")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-promievent@1.2.11")
          (s."web3-eth-abi@1.2.11")
          (s."web3-eth-contract@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-iban@1.2.11" = f "web3-eth-iban" "1.2.11" y "f5f73298305bc7392e2f188bf38a7362b42144ef" [
          (s."bn.js@^4.11.9")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth-personal@1.2.11" = f "web3-eth-personal" "1.2.11" y "a38b3942a1d87a62070ce0622a941553c3d5aa70" [
          (s."@types/node@^12.12.6")
          (s."web3-core@1.2.11")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-net@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-eth@1.2.11" = f "web3-eth" "1.2.11" y "4c81fcb6285b8caf544058fba3ae802968fdc793" [
          (s."underscore@1.9.1")
          (s."web3-core@1.2.11")
          (s."web3-core-helpers@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-core-subscriptions@1.2.11")
          (s."web3-eth-abi@1.2.11")
          (s."web3-eth-accounts@1.2.11")
          (s."web3-eth-contract@1.2.11")
          (s."web3-eth-ens@1.2.11")
          (s."web3-eth-iban@1.2.11")
          (s."web3-eth-personal@1.2.11")
          (s."web3-net@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-net@1.2.11" = f "web3-net" "1.2.11" y "eda68ef25e5cdb64c96c39085cdb74669aabbe1b" [
          (s."web3-core@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "web3-provider-engine@14.2.1" = f "web3-provider-engine" "14.2.1" y "ef351578797bf170e08d529cb5b02f8751329b95" [
          (s."async@^2.5.0")
          (s."backoff@^2.5.0")
          (s."clone@^2.0.0")
          (s."cross-fetch@^2.1.0")
          (s."eth-block-tracker@^3.0.0")
          (s."eth-json-rpc-infura@^3.1.0")
          (s."eth-sig-util@^1.4.2")
          (s."ethereumjs-block@^1.2.2")
          (s."ethereumjs-tx@^1.2.0")
          (s."ethereumjs-util@^5.1.5")
          (s."ethereumjs-vm@^2.3.4")
          (s."json-rpc-error@^2.0.0")
          (s."json-stable-stringify@^1.0.1")
          (s."promise-to-callback@^1.0.0")
          (s."readable-stream@^2.2.9")
          (s."request@^2.85.0")
          (s."semaphore@^1.0.3")
          (s."ws@^5.1.1")
          (s."xhr@^2.2.0")
          (s."xtend@^4.0.1")
          ];
        "web3-providers-http@1.2.11" = f "web3-providers-http" "1.2.11" y "1cd03442c61670572d40e4dcdf1faff8bd91e7c6" [
          (s."web3-core-helpers@1.2.11")
          (s."xhr2-cookies@1.1.0")
          ];
        "web3-providers-ipc@1.2.11" = f "web3-providers-ipc" "1.2.11" y "d16d6c9be1be6e0b4f4536c4acc16b0f4f27ef21" [
          (s."oboe@2.1.4")
          (s."underscore@1.9.1")
          (s."web3-core-helpers@1.2.11")
          ];
        "web3-providers-ws@1.2.11" = f "web3-providers-ws" "1.2.11" y "a1dfd6d9778d840561d9ec13dd453046451a96bb" [
          (s."eventemitter3@4.0.4")
          (s."underscore@1.9.1")
          (s."web3-core-helpers@1.2.11")
          (s."websocket@^1.0.31")
          ];
        "web3-shh@1.2.11" = f "web3-shh" "1.2.11" y "f5d086f9621c9a47e98d438010385b5f059fd88f" [
          (s."web3-core@1.2.11")
          (s."web3-core-method@1.2.11")
          (s."web3-core-subscriptions@1.2.11")
          (s."web3-net@1.2.11")
          ];
        "web3-utils@1.2.11" = f "web3-utils" "1.2.11" y "af1942aead3fb166ae851a985bed8ef2c2d95a82" [
          (s."bn.js@^4.11.9")
          (s."eth-lib@0.2.8")
          (s."ethereum-bloom-filters@^1.0.6")
          (s."ethjs-unit@0.1.6")
          (s."number-to-bn@1.7.0")
          (s."randombytes@^2.1.0")
          (s."underscore@1.9.1")
          (s."utf8@3.0.0")
          ];
        "web3@1.2.11" = f "web3" "1.2.11" y "50f458b2e8b11aa37302071c170ed61cff332975" [
          (s."web3-bzz@1.2.11")
          (s."web3-core@1.2.11")
          (s."web3-eth@1.2.11")
          (s."web3-eth-personal@1.2.11")
          (s."web3-net@1.2.11")
          (s."web3-shh@1.2.11")
          (s."web3-utils@1.2.11")
          ];
        "webpack-cli@3.3.12" = f "webpack-cli" "3.3.12" y "94e9ada081453cd0aa609c99e500012fd3ad2d4a" [
          (s."chalk@^2.4.2")
          (s."cross-spawn@^6.0.5")
          (s."enhanced-resolve@^4.1.1")
          (s."findup-sync@^3.0.0")
          (s."global-modules@^2.0.0")
          (s."import-local@^2.0.0")
          (s."interpret@^1.4.0")
          (s."loader-utils@^1.4.0")
          (s."supports-color@^6.1.0")
          (s."v8-compile-cache@^2.1.1")
          (s."yargs@^13.3.2")
          ];
        "webpack-sources@1.4.3" = f "webpack-sources" "1.4.3" y "eedd8ec0b928fbf1cbfe994e22d2d890f330a933" [
          (s."source-list-map@^2.0.0")
          (s."source-map@~0.6.1")
          ];
        "webpack-sources@^1.4.0" = s."webpack-sources@1.4.3";
        "webpack-sources@^1.4.1" = s."webpack-sources@1.4.3";
        "webpack@4.43.0" = f "webpack" "4.43.0" y "c48547b11d563224c561dad1172c8aa0b8a678e6" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-module-context@1.9.0")
          (s."@webassemblyjs/wasm-edit@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          (s."acorn@^6.4.1")
          (s."ajv@^6.10.2")
          (s."ajv-keywords@^3.4.1")
          (s."chrome-trace-event@^1.0.2")
          (s."enhanced-resolve@^4.1.0")
          (s."eslint-scope@^4.0.3")
          (s."json-parse-better-errors@^1.0.2")
          (s."loader-runner@^2.4.0")
          (s."loader-utils@^1.2.3")
          (s."memory-fs@^0.4.1")
          (s."micromatch@^3.1.10")
          (s."mkdirp@^0.5.3")
          (s."neo-async@^2.6.1")
          (s."node-libs-browser@^2.2.1")
          (s."schema-utils@^1.0.0")
          (s."tapable@^1.1.3")
          (s."terser-webpack-plugin@^1.4.3")
          (s."watchpack@^1.6.1")
          (s."webpack-sources@^1.4.1")
          ];
        "websocket@1.0.32" = f "websocket" "1.0.32" y "1f16ddab3a21a2d929dec1687ab21cfdc6d3dbb1" [
          (s."bufferutil@^4.0.1")
          (s."debug@^2.2.0")
          (s."es5-ext@^0.10.50")
          (s."typedarray-to-buffer@^3.1.5")
          (s."utf-8-validate@^5.0.2")
          (s."yaeti@^0.0.6")
          ];
        "websocket@^1.0.31" = s."websocket@1.0.32";
        "whatwg-fetch@2.0.4" = f "whatwg-fetch" "2.0.4" y "dde6a5df315f9d39991aa17621853d720b85566f" [];
        "which-module@2.0.0" = f "which-module" "2.0.0" y "d9ef07dce77b9902b8a3a8fa4b31c3e3f7e6e87a" [];
        "which-module@^2.0.0" = s."which-module@2.0.0";
        "which@1.3.1" = f "which" "1.3.1" y "a45043d54f5805316da8d62f9f50918d3da70b0a" [
          (s."isexe@^2.0.0")
          ];
        "which@2.0.2" = f "which" "2.0.2" y "7c6a8dd0a636a0327e10b59c9286eee93f3f51b1" [
          (s."isexe@^2.0.0")
          ];
        "which@^1.2.14" = s."which@1.3.1";
        "which@^1.2.9" = s."which@1.3.1";
        "which@^1.3.0" = s."which@1.3.1";
        "which@^1.3.1" = s."which@1.3.1";
        "which@^2.0.1" = s."which@2.0.2";
        "wide-align@1.1.2" = f "wide-align" "1.1.2" y "571e0f1b0604636ebc0dfc21b0339bbe31341710" [
          (s."string-width@^1.0.2")
          ];
        "wide-align@^1.1.0" = s."wide-align@1.1.2";
        "widest-line@2.0.1" = f "widest-line" "2.0.1" y "7438764730ec7ef4381ce4df82fb98a53142a3fc" [
          (s."string-width@^2.1.1")
          ];
        "widest-line@^2.0.0" = s."widest-line@2.0.1";
        "windows-release@3.3.3" = f "windows-release" "3.3.3" y "1c10027c7225743eec6b89df160d64c2e0293999" [
          (s."execa@^1.0.0")
          ];
        "windows-release@^3.1.0" = s."windows-release@3.3.3";
        "wordwrap@1.0.0" = f "wordwrap" "1.0.0" y "27584810891456a4171c8d0226441ade90cbcaeb" [];
        "wordwrap@^1.0.0" = s."wordwrap@1.0.0";
        "worker-farm@1.7.0" = f "worker-farm" "1.7.0" y "26a94c5391bbca926152002f69b84a4bf772e5a8" [
          (s."errno@~0.1.7")
          ];
        "worker-farm@^1.6.0" = s."worker-farm@1.7.0";
        "worker-farm@^1.7.0" = s."worker-farm@1.7.0";
        "wrap-ansi@5.1.0" = f "wrap-ansi" "5.1.0" y "1fd1f67235d5b6d0fee781056001bfb694c03b09" [
          (s."ansi-styles@^3.2.0")
          (s."string-width@^3.0.0")
          (s."strip-ansi@^5.0.0")
          ];
        "wrap-ansi@6.2.0" = f "wrap-ansi" "6.2.0" y "e9393ba07102e6c91a3b221478f0257cd2856e53" [
          (s."ansi-styles@^4.0.0")
          (s."string-width@^4.1.0")
          (s."strip-ansi@^6.0.0")
          ];
        "wrap-ansi@^5.1.0" = s."wrap-ansi@5.1.0";
        "wrap-ansi@^6.2.0" = s."wrap-ansi@6.2.0";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "write-file-atomic@2.4.3" = f "write-file-atomic" "2.4.3" y "1fd2e9ae1df3e75b8d8c367443c692d4ca81f481" [
          (s."graceful-fs@^4.1.11")
          (s."imurmurhash@^0.1.4")
          (s."signal-exit@^3.0.2")
          ];
        "write-file-atomic@^2.0.0" = s."write-file-atomic@2.4.3";
        "write-file-atomic@^2.3.0" = s."write-file-atomic@2.4.3";
        "write-file-atomic@^2.4.3" = s."write-file-atomic@2.4.3";
        "ws@3.3.3" = f "ws" "3.3.3" y "f1cf84fe2d5e901ebce94efaece785f187a228f2" [
          (s."async-limiter@~1.0.0")
          (s."safe-buffer@~5.1.0")
          (s."ultron@~1.1.0")
          ];
        "ws@5.2.2" = f "ws" "5.2.2" y "dffef14866b8e8dc9133582514d1befaf96e980f" [
          (s."async-limiter@~1.0.0")
          ];
        "ws@^3.0.0" = s."ws@3.3.3";
        "ws@^5.1.1" = s."ws@5.2.2";
        "xdg-basedir@3.0.0" = f "xdg-basedir" "3.0.0" y "496b2cc109eca8dbacfe2dc72b603c17c5870ad4" [];
        "xdg-basedir@^3.0.0" = s."xdg-basedir@3.0.0";
        "xhr-request-promise@0.1.3" = f "xhr-request-promise" "0.1.3" y "2d5f4b16d8c6c893be97f1a62b0ed4cf3ca5f96c" [
          (s."xhr-request@^1.1.0")
          ];
        "xhr-request-promise@^0.1.2" = s."xhr-request-promise@0.1.3";
        "xhr-request@1.1.0" = f "xhr-request" "1.1.0" y "f4a7c1868b9f198723444d82dcae317643f2e2ed" [
          (s."buffer-to-arraybuffer@^0.0.5")
          (s."object-assign@^4.1.1")
          (s."query-string@^5.0.1")
          (s."simple-get@^2.7.0")
          (s."timed-out@^4.0.1")
          (s."url-set-query@^1.0.0")
          (s."xhr@^2.0.4")
          ];
        "xhr-request@^1.0.1" = s."xhr-request@1.1.0";
        "xhr-request@^1.1.0" = s."xhr-request@1.1.0";
        "xhr2-cookies@1.1.0" = f "xhr2-cookies" "1.1.0" y "7d77449d0999197f155cb73b23df72505ed89d48" [
          (s."cookiejar@^2.1.1")
          ];
        "xhr@2.5.0" = f "xhr" "2.5.0" y "bed8d1676d5ca36108667692b74b316c496e49dd" [
          (s."global@~4.3.0")
          (s."is-function@^1.0.1")
          (s."parse-headers@^2.0.0")
          (s."xtend@^4.0.0")
          ];
        "xhr@^2.0.4" = s."xhr@2.5.0";
        "xhr@^2.2.0" = s."xhr@2.5.0";
        "xhr@^2.3.3" = s."xhr@2.5.0";
        "xtend@2.1.2" = f "xtend" "2.1.2" y "6efecc2a4dad8e6962c4901b337ce7ba87b5d28b" [
          (s."object-keys@~0.4.0")
          ];
        "xtend@4.0.2" = f "xtend" "4.0.2" y "bb72779f5fa465186b1f438f674fa347fdb5db54" [];
        "xtend@^4.0.0" = s."xtend@4.0.2";
        "xtend@^4.0.1" = s."xtend@4.0.2";
        "xtend@~2.1.1" = s."xtend@2.1.2";
        "xtend@~4.0.0" = s."xtend@4.0.2";
        "xtend@~4.0.1" = s."xtend@4.0.2";
        "y18n@4.0.0" = f "y18n" "4.0.0" y "95ef94f85ecc81d007c264e190a120f0a3c8566b" [];
        "y18n@^4.0.0" = s."y18n@4.0.0";
        "yaeti@0.0.6" = f "yaeti" "0.0.6" y "f26f484d72684cf42bedfb76970aa1608fbf9577" [];
        "yaeti@^0.0.6" = s."yaeti@0.0.6";
        "yallist@2.1.2" = f "yallist" "2.1.2" y "1c11f9218f076089a47dd512f93c6699a6a81d52" [];
        "yallist@3.0.3" = f "yallist" "3.0.3" y "b4b049e314be545e3ce802236d6cd22cd91c3de9" [];
        "yallist@3.1.1" = f "yallist" "3.1.1" y "dbb7daf9bfd8bac9ab45ebf602b8cbad0d5d08fd" [];
        "yallist@4.0.0" = f "yallist" "4.0.0" y "9bb92790d9c0effec63be73519e11a35019a3a72" [];
        "yallist@^2.1.2" = s."yallist@2.1.2";
        "yallist@^3.0.0" = s."yallist@3.0.3";
        "yallist@^3.0.2" = s."yallist@3.1.1";
        "yallist@^3.0.3" = s."yallist@3.0.3";
        "yallist@^4.0.0" = s."yallist@4.0.0";
        "yaml@1.10.0" = f "yaml" "1.10.0" y "3b593add944876077d4d683fee01081bd9fff31e" [];
        "yaml@^1.7.2" = s."yaml@1.10.0";
        "yargs-parser@13.1.2" = f "yargs-parser" "13.1.2" y "130f09702ebaeef2650d54ce6e3e5706f7a4fb38" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@15.0.1" = f "yargs-parser" "15.0.1" y "54786af40b820dcb2fb8025b11b4d659d76323b3" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@18.1.3" = f "yargs-parser" "18.1.3" y "be68c4975c6b2abf469236b0c870362fab09a7b0" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@^13.1.0" = s."yargs-parser@13.1.2";
        "yargs-parser@^13.1.2" = s."yargs-parser@13.1.2";
        "yargs-parser@^15.0.1" = s."yargs-parser@15.0.1";
        "yargs-parser@^18.1.2" = s."yargs-parser@18.1.3";
        "yargs-parser@^18.1.3" = s."yargs-parser@18.1.3";
        "yargs@13.2.4" = f "yargs" "13.2.4" y "0b562b794016eb9651b98bd37acf364aa5d6dc83" [
          (s."cliui@^5.0.0")
          (s."find-up@^3.0.0")
          (s."get-caller-file@^2.0.1")
          (s."os-locale@^3.1.0")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^3.0.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^13.1.0")
          ];
        "yargs@13.3.2" = f "yargs" "13.3.2" y "ad7ffefec1aa59565ac915f82dccb38a9c31a2dd" [
          (s."cliui@^5.0.0")
          (s."find-up@^3.0.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^3.0.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^13.1.2")
          ];
        "yargs@14.2.3" = f "yargs" "14.2.3" y "1a1c3edced1afb2a2fea33604bc6d1d8d688a414" [
          (s."cliui@^5.0.0")
          (s."decamelize@^1.2.0")
          (s."find-up@^3.0.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^3.0.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^15.0.1")
          ];
        "yargs@15.4.1" = f "yargs" "15.4.1" y "0d87a16de01aee9d8bec2bfbf74f67851730f4f8" [
          (s."cliui@^6.0.0")
          (s."decamelize@^1.2.0")
          (s."find-up@^4.1.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^4.2.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^18.1.2")
          ];
        "yargs@^13.3.2" = s."yargs@13.3.2";
        "yargs@^14.2.3" = s."yargs@14.2.3";
        "yargs@^15.0.1" = s."yargs@15.4.1";
        }