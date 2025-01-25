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
        config = "colorscheme catppuccin-mocha";
      }
      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-lua
          p.tree-sitter-java
          p.tree-sitter-zig
          p.tree-sitter-c
          p.tree-sitter-cpp
          p.tree-sitter-cmake
          p.tree-sitter-css
          p.tree-sitter-markdown
          p.tree-sitter-markdown-inline
        ]);
        config = toLuaFile ./treesitter.lua;
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim-lsp.lua;
      }
      {
        plugin = lazy-lsp-nvim;
        config = toLuaFile ./lazy-lsp.lua;
      }
      {
        plugin = undotree;
        config = "noremap <F5> :UndoTreeToggle<CR>";
      }
      {
        plugin = ts-comments-nvim;
        config = toLua "require('ts-comments').setup{}";
      }
      {
        plugin = trouble-nvim;
        config = toLuaFile ./trouble.lua;
      }
      {
        plugin = todo-comments-nvim;
        config = toLuaFile ./todo-comments.lua;
      }
      {
        plugin = nvim-tree-lua;
        config = toLuaFile ./nvim-tree.lua;
      }

      vim-fugitive
      cmp-nvim-lsp
      nvim-lspconfig
      vim-nix
    ];
  }

