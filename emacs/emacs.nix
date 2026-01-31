{ pkgs }: {
  enable = true;
  extraConfig = builtins.readFile ./emacs.el;
  # NOTE: for vim-nix autocompletion of pkg names.
  extraPackages = _: with pkgs.emacsPackages; [
    catppuccin-theme

    # modes
    company
    # zig-mode
  ];
}
