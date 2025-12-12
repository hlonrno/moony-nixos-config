{ pkgs, ... }: {
  enable = true;
  clock24 = true;
  disableConfirmationPrompt = true;
  keyMode = "vi";
  shell = "${pkgs.bash}/bin/bash";
  terminal = "screen-255color";
  shortcut = "a";
  plugins = with pkgs; [
    tmuxPlugins.nord
  ];
}
