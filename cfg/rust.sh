#rustup target add wasm32-unknown-unknown
rustup default nightly
export RUST_BACKTRACE=1
export RUSTFLAGS='-Z macro-backtrace'
