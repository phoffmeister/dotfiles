local M = {}

M.setup = function ()
    local lspkind = require'lspkind'
    local cmp = require'cmp'
    cmp.setup({
        snippet = {
            expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            ['<C-Space>'] = cmp.mapping.complete(),
        },
        sources = {
            {name = 'vim-dadbod-completion'},
            {name = 'neorg'},
            {name = 'nvim_lua'},
            {name = 'nvim_lsp'},
            {name = 'path'},
            {name = 'luasnip'},
            {name = 'buffer', keyword_length = 5},
        },
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]",
                }
            })
        },
        experimental = {
            native_menu = false,
            ghost_text = true
        }
    })
end

return M
