{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    #nodejs-14_x
    #nodejs-16_x
    #nodejs-18_x
    #nodejs-20
    nodejs_latest
    nodePackages.pnpm
    nodePackages.yarn
    python310 # for gyp
    #deno
    bun
    swc
  ];
}
