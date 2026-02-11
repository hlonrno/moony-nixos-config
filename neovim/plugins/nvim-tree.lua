--[[
require('nvim-tree').setup({
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
})

vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>NvimTreeToggle<cr>', { noremap = true })
]]
