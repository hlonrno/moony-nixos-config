{ pkgs }: {
  enable = true;
  extraConfig = builtins.readFile ./emacs;
  extraPackages = epkgs: [

  ];
}
