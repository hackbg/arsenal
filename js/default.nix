{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    #nodejs-14_x
    nodejs-17_x
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    python310 # for gyp
    #deno
  ];
}
