require('nvim-treesitter').setup {
  highlight = {
    enable = true,
    sync_install = false,
    auto_install = false,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)  -- larger than 10Mi
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > 10 * 1024 * 1024
    end,
  },
}

