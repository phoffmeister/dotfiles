local M = {}
M.setup = function ()
    local ls = require "luasnip"

    ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    }

    vim.keymap.set({ "i", "s"}, "<c-k>", function ()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true })

    vim.keymap.set({ "i", "s"}, "<c-j>", function ()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true })

    vim.keymap.set("i", "<c-l>", function ()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })

    local s = ls.s
    local fmt = require("luasnip.extras.fmt").fmt
    local i = ls.insert_node
    ls.add_snippets("go",{
            s("fi", fmt("file, _ := os.Open(\"{}\")\ndefer file.Close()\nscanner := bufio.NewScanner(file)\nfor scanner.Scan() {{\n    {}\n}}\n", {i(1), i(0, "line := scanner.Text()")})),
            s("func", fmt("func {}({}) {{\n    {}\n}}", {i(1), i(2), i(0)})),
    })
end

return M
