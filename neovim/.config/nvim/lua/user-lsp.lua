local M = {}

M.setup = function()
    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>fk', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
    end

    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    local lua_settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim', 'love' },
            },
            workspace = {
                library = {
                    vim.api.nvim_get_runtime_file("", true),
                    "${3rd}/love2d/library"
                },
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }

    local servers = {
        'pyright',
        'rust_analyzer',
        'sumneko_lua',
        'clangd',
        'tsserver',
        'gopls',
        'cssls',
        'dartls',
        'html',
        'phpactor',
        'pylsp',
        -- 'denols',
    }

    for _, lsp in ipairs(servers) do
        if lsp == 'sumneko_lua' then
            nvim_lsp[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = lua_settings
            }
        elseif lsp == 'cssls' then
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            nvim_lsp[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        else
            nvim_lsp[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end
    end
end

return M
