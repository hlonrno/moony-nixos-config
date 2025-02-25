local cmp = require('cmp')

cmp.setup {
    enabled = function()
        return not cmp.config.context.in_treesitter_capture('Comment')
    end,

    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.windows.bordered(),
        documentation = cmp.config.windows.bordered {
            max_width = 80,
            max_height = 50,
        },
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<A-j>'] = cmp.mapping.select_next_item {},
        ['<A-k>'] = cmp.mapping.select_prev_item {},
        ['<Tab>'] = cmp.mapping.confirm { select = true },
        ['<C-.>'] = cmp.mapping.cmplete {},
    },

    sources = {
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'buffer',   group_index = 2 },
    },

    experimental = {
        ghost_text = true,
    },
}
