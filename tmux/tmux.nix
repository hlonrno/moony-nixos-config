{ pkgs, ... }: {
  enable = true;
  clock24 = true;
  disableConfirmationPrompt = true;
  keyMode = "vi";
  shell = "${pkgs.bash}/bin/bash";
  terminal = "screen-256color";
  shortcut = "a";
  reverseSplit = true;
  plugins = with pkgs.tmuxPlugins; [
    sensible
    nord
    vim-tmux-navigator
  ];
  # extraConfig = builtins.readFile ./tmux.conf;
}
