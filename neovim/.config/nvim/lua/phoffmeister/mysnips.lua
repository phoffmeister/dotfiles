local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local function set_keymaps()
    vim.keymap.set({ 'i', 's' }, '<c-j>', function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end)

    vim.keymap.set({ 'i', 's' }, '<c-k>', function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end)

    vim.keymap.set({ 'i', 's' }, '<c-n>', function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end)

    vim.keymap.set({ 'i', 's' }, '<c-p>', function()
        if ls.choice_active() then
            ls.change_choice(-1)
        end
    end)
end

local function uuid()
    local id, _ = vim.fn.system('uuidgen'):gsub('\n', '')
    return id
end

local function get_branch_tag()
    local branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
    local tag = branch:match('(%w+-%d+)')
    if not tag then
        return '[TASKLESS]'
    end
    tag = tag:upper()
    return '[' .. tag .. ']'
end

local function setup()
    set_keymaps()
    ls.add_snippets(
        "gitcommit", {
            s("co", fmt("[{}-{}] {}", {
                c(1, {
                    t("XBOX"),
                    t("DEAT"),
                    i(nil, "TASK"),
                }),
                i(2, "0000"),
                i(0, "what did you do?"),
            }))
        })
    ls.add_snippets(
        'gitcommit', {
            s('cc', fmt('{} {}', {
                f(get_branch_tag, {}),
                i(1, 'commit message'),
            }))
        })
    ls.add_snippets(
        'all', {
            s({
                trig = 'uuid',
                name = 'UUID',
                dscr = 'Generate a unique UUID'
            }, {
                d(1, function() return sn(nil, i(1, uuid())) end)
            })
        })
end

return {
    setup = setup
}
