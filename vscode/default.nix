{ pkgs, ... }: {
  name = "hackbg-arsenal-vscode";
  paths = with pkgs; [
    vscodium-fhs
  ];
}
