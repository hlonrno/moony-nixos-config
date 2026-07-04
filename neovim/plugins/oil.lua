require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  delete_to_trash = false,
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = true,
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = false,
  },
  constrain_cursor = "editable",
  watch_for_changes = false,
  keymaps = {
    ["g?"] =   { "actions.show_help", mode = "n" },
    ["<CR>"] =   "actions.select",
    ["<C-p>"] =  "actions.preview",
    ["<A-l>"]=   "actions.refresh",
    ["-"] =    { "actions.parent", mode = "n" },
    ["gs"] =   { "actions.change_sort", mode = "n" },
    ["g."] =   { "actions.toggle_hidden", mode = "n" },

    ["<C-s>"] = false,
    ["<C-h>"] = false,
    ["<C-t>"] = false,
    ["<C-c>"] = false,
    ["<C-l>"] = false,
    ["_"] = false,
    ["`"] = false,
    ["g~"] = false,
    ["gx"] = false,
    ["g\\"] = false,
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = false,
    natural_order = false,
    case_insensitive = false,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },

  float = {
    preview_split = "right",
  },
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = "fast_scratch", -- "load"|"scratch"|"fast_scratch"
  },
})

vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>Oil<cr>', { noremap = true })
