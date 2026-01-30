{ pkgs }: {
  enabe = true;
  extraConfix = builtins.readFile ./emacs;
  extraPackages = epkgs: [

  ];
}
