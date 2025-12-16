{
  enable = true;
  shellAliases = {
    nixswitch = "sudo nixos-rebuild switch --flake ${./nixos}#t";
    nixtest = "sudo nixos-rebuild test --flake ${./nixos}#t";
    homeswitch = "home-manager switch";
    ".." = "cd ..";
  };

  bashrcExtra = ''
  '';

  initExtra = ''
    if [ $EUID == 0 ]; then
      PS1="\033[92m\w \033[94m\u# \033[0m";
    else
      PS1="\033[92m\w \033[97m\u$ \033[0m";
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
