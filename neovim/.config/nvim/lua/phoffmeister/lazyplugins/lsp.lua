return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.api.nvim_create_user_command('Format', function()
                if vim.lsp.buf.format then
                    vim.lsp.buf.format()
                    print('File formatted with LSP')
                elseif vim.lsp.buf.formatting then
                    vim.lsp.buf.formatting()
                    print('File formatted with LSP')
                else
                    print('There is no formatter for this.')
                end
            end, { desc = 'Format current buffer with LSP' })

            local servers = { 'lua_ls', 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls', 'zls',
                'ruby_lsp', 'kotlin_language_server', }
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            for _, lsp in ipairs(servers) do
                if lsp == "rust_analyzer" then
                    require('lspconfig')[lsp].setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                checkOnSave = {
                                    command = "clippy",
                                },
                            }
                        }
                    }
                else
                    require('lspconfig')[lsp].setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end
            end
        end,
    },
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require('fidget').setup {
                text = {
                    spinner = "moon",
                }
            }
        end,
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier
                }
            }
        end,
    }
}
