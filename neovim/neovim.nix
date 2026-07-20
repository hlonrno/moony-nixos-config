pkgs: {
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  initLua = builtins.readFile ./init.lua;

  plugins = with pkgs.vimPlugins; [
    {
      plugin = catppuccin-nvim;
      type = "viml";
      config = "colorscheme catppuccin-macchiato";
    }
    {
      plugin = nvim-treesitter;
      type = "lua";
      config = builtins.readFile ./plugins/treesitter.lua;
    }
    {
      plugin = lazy-lsp-nvim;
      type = "lua";
      config = builtins.readFile ./plugins/lazy-lsp.lua;
    }
    {
      plugin = undotree;
      type = "viml";
      config = "noremap <leader>gt :UndotreeToggle<CR>";
    }
    {
      plugin = ts-comments-nvim;
      type = "lua";
      config = "require('ts-comments').setup{}";
    }
    {
      plugin = todo-comments-nvim;
      type = "lua";
      config = builtins.readFile ./plugins/todo-comments.lua;
    }
    {
      plugin = oil-nvim;
      type = "lua";
      config = builtins.readFile ./plugins/oil.lua;
    }
    {
      plugin = telescope-nvim;
      type = "lua";
      config = builtins.readFile ./plugins/telescope.lua;
    }
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./plugins/nvim-cmp.lua;
    }
    {
      plugin = vim-tmux-navigator;
      type = "lua";
      config = builtins.readFile ./plugins/vim-tmux-navigator.lua;
    }
    {
      plugin = trouble-nvim;
      type = "lua";
      config = builtins.readFile ./plugins/trouble.lua;
    }

    vim-visual-multi
    vim-fugitive
    cmp-nvim-lsp
    vim-nix
  ];
}
