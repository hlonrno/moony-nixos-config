{
  shellAliases = {
    homeswitch = "home-manager switch";
    ".." = "cd ..";
  };

  shellOptions = [
    "globstar"
    "histappend"
  ];
}
