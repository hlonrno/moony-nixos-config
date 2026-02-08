local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', opts)

