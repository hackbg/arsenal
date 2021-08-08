{ pkgs ? import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; } }: pkgs.mkShell {

  name = "hackbg-arsenal";

  propagatedBuildInputs = with pkgs; [
    hackbg.js
    hackbg.neovim
    hackbg.rust
    hackbg.util
  ];

  shellHook = ''
    export RUST_BACKTRACE=1
    export RUSTFLAGS="-Zmacro-backtrace"
    export PATH="$PATH:$HOME/.cargo/bin"
    fortune|cowsay
    export PS1=
    CATS=(😺 😸 😹 😻 😼 😽 🙀 😿 😾 ⚔️  🏀 ⚽ 🎩 🐰 🌙)
    CAT=$\{CATS[$RANDOM % $\{#CATS[@]}]};
    function success_indicator() {
      if [ $? -eq 0 ] ; then echo "🟢"; else echo "🔴 $?"; fi }
    export PS1='$(success_indicator)\n\n\n$CAT \e[0;35m⬢ \w\e[0m '
  '';

  EDITOR  = "nvim";

  BROWSER = "surf";

}
