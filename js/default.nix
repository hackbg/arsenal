{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    #nodejs-14_x
    nodejs-17_x
    nodePackages.pnpm
    yarn
    #deno
  ];
}
