{
  shellAliases = {
    homeswitch = "home-manager switch";
    ".." = "cd ..";
  };

  bashrcExtra = ''
    PS1="\033[96m\u$ \033[0m"
  '';

  shellOptions = [
    "globstar"
    "histappend"
  ];
}
