{pkgs?(import<nixpkgs>{})}:pkgs.mkShell{
  name = "rust-protobuf";
  nativeBuildInputs = with pkgs; [ cargo rustc protobuf ];
}
