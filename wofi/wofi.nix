{
  enable = true;
  settings = {
    width = 250;
    height = 400;
    hide_scroll = true;
    insensitive = true;
    key_expand = "semicolon";
  };
  style = builtins.readFile ./style.css;
}

