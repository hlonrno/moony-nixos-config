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
      debounce_text_changes = 100000,
    },
    
    on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = vim.lsp.omnifunc

      local opts = { noremap = true, buffer = bufnr }

      vim.keymap.set('n', "<A-d>", vim.lsp.buf.definition, opts)
      vim.keymap.set('n', "<A-D>", vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', "<A-.>", vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set('n', "<A-r>", vim.lsp.buf.references, opts)
      vim.keymap.set('v', "<A-F>", vim.lsp.buf.formatexpr, opts)
      vim.keymap.set('n', "<A-i>", vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', "<A-K>", vim.lsp.buf.document_symbol, opts)
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
})
