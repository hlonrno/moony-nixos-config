require("nvim-tree").setup({
  view = {
    width = 30,
  },
  filters = {
    dotfiles = true,
  },
})

local opts = { noremap = true }

vim.api.nvim_set_keymap('n', "<leader>fe", "<cmd>NvimTreeToggle<cr>", opts)

