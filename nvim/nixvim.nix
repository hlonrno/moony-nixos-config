{ ... }: {
  enableMan = true;
  impureRtp = false;
  viAlias = true;
  vimAlias = true;

  colorschemes.everforest = {
    enable = true;
    settings = {
      background = "hard";
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
    # TODO: change root_markers to include ".jj"
    nixd.enable = true;
    lua_ls.enable = true;
    clangd.enable = true;
    jdtls.enable = true;
    marksman.enable = true;
  };

  opts = import ./opts.nix;
  keymaps = import ./keymaps.nix;
}
