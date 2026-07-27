let
  any-mode = [ "n" "v" "i" ];
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
    mode = any-mode;
    key = "<leader>o";
    action = ":only<cr>";
    options = opts;
  }
  {
    mode = any-mode;
    key = "<leader>h";
    action = ":split<cr>";
    options = opts;
  }
  {
    mode = any-mode;
    key = "<leader>v";
    action = ":vsplit<cr>";
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
    mode = any-mode;
    key = "<A-k>";
    action = ":lua vim.diagnostic.open_float()<cr>";
    options = opts;
  }
]
