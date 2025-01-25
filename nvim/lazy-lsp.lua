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
    
    on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = vim.lsp.omnifunc

      local opts = { noremap = true }

      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-d>", vim.lsp.buf.definition(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-D>", vim.lsp.buf.declaration(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-.>", vim.lsp.buf.code_action(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<F2>", vim.lsp.buf.rename(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-r>", vim.lsp.buf.references(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'v', "<A-F>", vim.lsp.buf.formatexpr(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-i>", vim.lsp.buf.implementation(), opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', "<A-K>", vim.lsp.buf.document_symbol(), opts)
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
})
