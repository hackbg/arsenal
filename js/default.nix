{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    #nodejs-14_x
    nodejs-18_x
    nodePackages.pnpm
    nodePackages.yarn
    python310 # for gyp
    #deno
  ];
}
