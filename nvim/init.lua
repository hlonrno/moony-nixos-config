vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.updatetime = 100;
vim.opt.termguicolors = true

vim.g.zig_fmt_autosave = 0

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.fileencoding = 'utf-8'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.colorcolumn = { 80 }
vim.opt.expandtab = true
vim.opt.showmode = false

vim.opt.showtabline = 0
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true

vim.opt.signcolumn = 'yes'

local opts = { noremap = true }

vim.api.nvim_set_keymap('n', 'H', 'Hzz', opts)
vim.api.nvim_set_keymap('n', 'L', 'Lzz', opts)

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)

vim.api.nvim_set_keymap('v', '<A-e>', 'y:e <C-r>0', opts);

vim.api.nvim_set_keymap('n', '<A-k>', ':lua vim.diagnostic.open_float()<CR>', opts);
