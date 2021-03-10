rustup update

rustup target add wasm32-unknown-unknown
export RUST_BACKTRACE=1

rustup default nightly
export RUSTFLAGS="-Zmacro-backtrace"

rustup component add llvm-tools-preview
#export RUSTFLAGS="$RUSTFLAGS -Zinstrument-coverage"
cargo install grcov
export PATH="$PATH:$HOME/.cargo/bin"
