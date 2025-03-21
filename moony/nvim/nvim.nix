{ pkgs }:
let
  toLua = code: "lua << EOF\n${code}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.readFile ./init.lua;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = catppuccin-nvim;
        config = ''
          augroup user_colors
            autocmd!
            autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
          augroup END

          colorscheme catppuccin-mocha
        '';
      }
      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-lua
          p.tree-sitter-java
          p.tree-sitter-zig
          p.tree-sitter-rust
          p.tree-sitter-markdown
          p.tree-sitter-markdown-inline
        ]);
        config = toLuaFile ./plugins/treesitter.lua;
      }
      {
        plugin = lazy-lsp-nvim;
        config = toLuaFile ./plugins/lazy-lsp.lua;
      }
      {
        plugin = undotree;
        config = "noremap <F5> :UndotreeToggle<CR>";
      }
      {
        plugin = ts-comments-nvim;
        config = toLua "require('ts-comments').setup{}";
      }
      {
        plugin = trouble-nvim;
        config = toLuaFile ./plugins/trouble.lua;
      }
      {
        plugin = todo-comments-nvim;
        config = toLuaFile ./plugins/todo-comments.lua;
      }
      {
        plugin = nvim-tree-lua;
        config = toLuaFile ./plugins/nvim-tree.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/telescope.lua;
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugins/nvim-lsp.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugins/lsp-config.lua;
      }

      vim-visual-multi
      vim-fugitive
      cmp-nvim-lsp
      vim-nix
    ];
  }

