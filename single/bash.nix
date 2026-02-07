{
  shellAliases = {
    homeswitch = "home-manager switch";
    ".." = "cd ..";
  };

  bashrcExtra = ''
    if [ $EUID == 0 ]; then
      PS1="\033[94m\u# \033[0m";
    else
      PS1="\033[97m\u$ \033[0m";
    fi

    set completion-ignore-case on
    set completion-map-case on
    set completion-prefix-display-length 0
  '';

  shellOptions = [
    "globstar"
    "histappend"
  ];
}
