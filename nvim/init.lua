-- Show diagnostic in floating window for golang --
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)  -- "go line" diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Set tab to 4 spaces --
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

--Enable System Clipboard --
vim.opt.clipboard = "unnamedplus"

-- Required for Colorizer --
vim.opt.termguicolors = true

-- Lazy Plugin Manager --
require("config.lazy")
require("lazy").setup("plugins")
