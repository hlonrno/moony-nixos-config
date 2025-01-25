require("lazy-lsp").setup({
  excluded_servers = {
    "ccls", "denols", "docker_compose_language_service",
    "flow", "ltex", "quick_lint_js", "scry", "tailwindcss"
  },
  preferred_servers = {
    java = { "jdtls" },
    c = { "clangd" },
    cpp = { "clangd" },
    zig = { "zls" },
    nix = { "nixd" },
    markdown = { "marksman" },
    lua = { "lua_ls" },
  },

  prefer_local = true,
  default_config = {
    flags = {
      debounce_text_changes = 100,
    },

    on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { noremap = true }

      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-d>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-D>', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-i>', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-t>', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-r>', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-.>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
})
