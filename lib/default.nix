pkgs: {

  packages = pkglists:
    pkgs.lib.lists.foldl
      (x: y: x ++ ((import y) pkgs))
      []
      pkglists;

  environment = cfglists:
    pkgs.lib.lists.foldl
      (x: y: x + "\necho ${y}\n" + builtins.readFile y)
      ""
      cfglists;

}
