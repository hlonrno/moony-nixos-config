{ pkgs, ... }: {
  enable = true;
  clock24 = true;
  disableConfirmationPrompt = true;
  keyMode = "vi";
  shell = "${pkgs.bash}/bin/bash";
  terminal = "screen-256color";
  shortcut = "\\ ";
  baseIndex = 1;
  plugins = with pkgs.tmuxPlugins; [
    sensible
    nord
    vim-tmux-navigator
    catppuccin
    yank
  ];
}
