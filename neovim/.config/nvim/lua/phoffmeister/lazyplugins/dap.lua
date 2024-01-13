local function setup_keymaps()
    local dap = require("dap")
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
end

local function setup_listeners()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end
end

local function config_dap()
    require "dapui".setup()
    require 'dap-python'.setup('/home/phoffmeister/.pyenv/versions/debugpyenv/bin/python')

    setup_listeners()
    setup_keymaps()
end

return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'mfussenegger/nvim-dap-python',
    },
    config = config_dap
}
