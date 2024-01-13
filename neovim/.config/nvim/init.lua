local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: leader has to be set before lazy
require'phoffmeister.leader'.setup()

require'lazy'.setup('lazyplugins')

require'phoffmeister.sets'.setup()
require'phoffmeister.yankonhighlight'.setup()
require'phoffmeister.keymaps'.setup()
require'phoffmeister.dev'.setup()

vim.cmd [[colorscheme nightfly]]
