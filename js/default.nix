{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    nodejs-14_x
    nodePackages.pnpm
    yarn
    #deno
  ];
}
