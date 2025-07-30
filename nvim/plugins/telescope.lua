local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>bf', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
