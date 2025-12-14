{
  enable = true;
  shellAliases = {
    nixswitch = "sudo nixos-rebuild switch --flake ${./nixos}#t";
    nixtest = "sudo nixos-rebuild test --flake ${./nixos}#t";
    homeswitch = "home-manager switch";
    ".." = "cd ..";
  };

  bashrcExtra = ''
    if [ $EUID == 0 ]; then
      PS1="\w # ";
    else
      PS1="\w $ ";
    fi
  '';

  shellOptions = [

  ];
}
