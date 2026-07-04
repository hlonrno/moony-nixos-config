pkgs:
let
  toLua = code: "lua << EOF\n${code}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
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
      type = "viml";
      config = toLuaFile ./plugins/treesitter.lua;
    }
    {
      plugin = lazy-lsp-nvim;
      type = "viml";
      config = toLuaFile ./plugins/lazy-lsp.lua;
    }
    {
      plugin = undotree;
      type = "viml";
      config = "noremap <leader>gt :UndotreeToggle<CR>";
    }
    {
      plugin = ts-comments-nvim;
      type = "viml";
      config = toLua "require('ts-comments').setup{}";
    }
    {
      plugin = todo-comments-nvim;
      type = "viml";
      config = toLuaFile ./plugins/todo-comments.lua;
    }
    {
      plugin = oil-nvim;
      type = "viml";
      config = toLuaFile ./plugins/oil.lua;
    }
    {
      plugin = telescope-nvim;
      type = "viml";
      config = toLuaFile ./plugins/telescope.lua;
    }
    {
      plugin = nvim-cmp;
      type = "viml";
      config = toLuaFile ./plugins/nvim-cmp.lua;
    }
    # {
    #   plugin = nvim-lspconfig;
    #   type = "viml";
    #   config = toLuaFile ./plugins/lsp-config.lua;
    # }
    {
      plugin = vim-tmux-navigator;
      type = "viml";
      config = toLuaFile ./plugins/vim-tmux-navigator.lua;
    }

    vim-visual-multi
    vim-fugitive
    cmp-nvim-lsp
    vim-nix
    trouble-nvim
  ];
}
