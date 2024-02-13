pkgs: oldPkgs: let
  env = src: (pkgs.buildEnv ((import src) pkgs));
  pkg = src: (pkgs.callPackage (import src) {});
in {
  hackbg = {
    bcrypt-tool  = pkg ./go/bcrypt-tool.nix;
    clockify-cli = pkg ./go/clockify-cli.nix;
    gl           = env ./gl;
    go           = env ./go;
    js           = env ./js;
    lazydocker   = pkg ./go/lazydocker.nix;
    lazygit      = pkg ./go/lazygit.nix;
    lazynpm      = pkg ./go/lazynpm.nix;
    neovim       = env ./ide/neovim.nix;
    nvm          = pkg ./js/nvm.nix;
    rust         = env ./rust;
    secretcli    = pkg ./go/secretcli.nix;
    solidity     = env ./solidity;
    util         = env ./util;
    vscode       = env ./ide/vscode.nix;
  };
}
