-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Highlight current line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
-- vim.g.lazyvim_colorscheme = "lunaperche"
vim.g.lazyvim_colorscheme = "tokyonight"
-- ~/.config/nvim/lua/config/options.lua

-- Reduce time Neovim waits for mapped sequences
vim.opt.timeoutlen = 200 -- default is 1000; try 300 or even 200

-- Shorten the delay for 'CursorHold' events
vim.opt.updatetime = 200 -- default is 4000; 200–300 is typical

vim.g.lazyvim_prettier_needs_config = false
