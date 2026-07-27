{ ... }: {
  enableMan = true;
  impureRtp = false;
  viAlias = true;
  vimAlias = true;

  colorschemes.everforest = {
    enable = true;
    settings = {
      background = "medium";
      disable_italic_comment = 1;
    };
  };

  plugins = {
    lspconfig.enable = true;
    fugitive.enable = true;
    oil.enable = true;
    orgmode.enable = true;
    tmux-navigator.enable = true;
    todo-comments.enable = true;
    visual-multi.enable = true;
    trouble.enable = true;
    web-devicons.enable = true;
    image.enable = true;
    hex.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      settings.mapping = {
        "<Tab>" = "cmp.mapping.confirm()";
        "<A-k>" = "cmp.mapping.select_prev_item()";
        "<A-j>" = "cmp.mapping.select_next_item()";
        "<A-K>" = "cmp.mapping.scroll_docs(-3)";
        "<A-J>" = "cmp.mapping.scroll_docs(3)";
        "<C-c>" = "cmp.mapping.close_docs()";
        "<C-C>" = "cmp.mapping.open_docs()";
      };
      settings.experimental = {
        ghost_text = true;
      };
    };
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = false;
    };
  };

  lsp.keymaps = import ./lsp/keymaps.nix;
  lsp.servers = {
    nixd.enable = true;
    lua_ls.enable = true;
    clangd.enable = true;
    jdtls.enable = true;
    marksman.enable = true;
  };

  opts = import ./opts.nix;
  keymaps = import ./keymaps.nix;
  
  extraConfigLua = ''
    local extraRootMarkers = { '.jj', 'Makefile', 'shell.nix', 'src' }
    table.insert(vim.lsp.config['clangd'].root_markers, extraRootMarkers)
    table.insert(vim.lsp.config['jdtls'].root_markers, extraRootMarkers)
    table.insert(vim.lsp.config['marksman'].root_markers, extraRootMarkers)
    table.insert(vim.lsp.config['nixd'].root_markers, extraRootMarkers)
  '';
}
