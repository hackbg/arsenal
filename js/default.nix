{ pkgs, ... }: {
  name = "hackbg-arsenal-javascript";
  paths = with pkgs; [ nodejs-14_x
                       yarn ]; }
