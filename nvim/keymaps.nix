let
  opts = {
    silent = true;
    noremap = true;
  };
in
[
  {
    mode = "n";
    key = "<";
    action = "V<";
    options = opts;
  }
  {
    mode = "n";
    key = ">";
    action = "V>";
    options = opts;
  }
  {
    mode = "v";
    key = "<";
    action = "<gv";
    options = opts;
  }
  {
    mode = "v";
    key = ">";
    action = ">gv";
    options = opts;
  }
  {
    mode = "n";
    key = "<C-S-Up>";
    action = ":resize -2<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<C-S-Down>";
    action = ":resize +2<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<C-S-Left>";
    action = ":vertical resize -2<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<C-S-Right>";
    action = ":vertical resize +2<cr>";
    options = opts;
  }
  {
    mode = [ "n" "v" "i" ];
    key = "<leader>o";
    action = "<esc>:only<cr>";
    options = opts;
  }
  {
    mode = [ "n" "v" "i" ];
    key = "<leader>h";
    action = "<esc>:split<cr>";
    options = opts;
  }
  {
    mode = [ "n" "v" "i" ];
    key = "<leader>v";
    action = "<esc>:vsplit<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<leader>e";
    action = ":e <C-r><C-p><cr>";
    options = opts;
  }
  {
    mode = "v";
    key = "<leader>e";
    action = "y:e <C-r>0<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<leader>E";
    action = ":q | e <C-r><C-p><cr>";
    options = opts;
  }
  {
    mode = "n";
    key = ";";
    action = ":noh<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<leader>fe";
    action = ":Oil<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<leader>tt";
    action = ":TodoTrouble<cr>";
    options = opts;
  }
  {
    mode = "n";
    key = "<leader>m";
    action = ":!!<cr>";
    options = { noremap = true; };
  }
]
