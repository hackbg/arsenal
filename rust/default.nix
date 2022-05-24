{ pkgs, ... }: {
  name = "hackbg-arsenal-rust";
  paths = with pkgs; [

    # rust toolchain
    (rustChannelOfTargets "nightly" "2022-03-03" ["wasm32-unknown-unknown"])
    #((import ./tarpaulin.nix) pkgs)

    # webassembly tools
    binaryen
    wabt
    wasm-pack
    wasm-bindgen-cli

  ];
}
