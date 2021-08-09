#rustup update
#rustup target add wasm32-unknown-unknown
#rustup default nightly
#rustup component add llvm-tools-preview rls rust-analysis rust-src
#export RUSTFLAGS="$RUSTFLAGS -Zinstrument-coverage"
#cargo install grcov
export RUST_BACKTRACE=1
export RUSTFLAGS="-Zmacro-backtrace"
export PATH="$PATH:$HOME/.cargo/bin"
