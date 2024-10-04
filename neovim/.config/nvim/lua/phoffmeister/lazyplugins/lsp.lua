return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.api.nvim_create_user_command('Format', function()
                if vim.lsp.buf.format then
                    vim.lsp.buf.format()
                elseif vim.lsp.buf.formatting then
                    vim.lsp.buf.formatting()
                else
                    print('There is no formatter for this.')
                end
            end, { desc = 'Format current buffer with LSP' })

            local on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end

                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
                end

                nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                nmap('gll', require('telescope.builtin').diagnostics, '[G]oto [L]ocation [L]ist')
                nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            end
            local servers = { 'lua_ls', 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls',
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
