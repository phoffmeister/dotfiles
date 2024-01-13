local function set_space_as_leader()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '
    vim.keymap.set('', '<Space>', '<Nop>')
end

return {
    setup = set_space_as_leader,
}
