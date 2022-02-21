{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [
    #nodejs-14_x
    nodejs-17_x
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    python3 # for gyp
    #deno
  ];
}
