-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local del = vim.keymap.del

-- Unmap annoying move on esc
del({ "n", "i", "v" }, "<A-j>")
del({ "n", "i", "v" }, "<A-k>")
