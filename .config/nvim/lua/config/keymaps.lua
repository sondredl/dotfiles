-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- local del = vim.keymap.del

-- Unmap annoying move on esc
-- del({ "n", "i", "v" }, "<A-j>")
-- del({ "n", "i", "v" }, "<A-k>")

-- vim.keymap.set("v", "s", "c", { noremap = true, silent = true })

local map = vim.keymap.set

-- Replace :Ex / :Explore / :Sex / :Vex with neo-tree

-- :Ex / :Explore → open neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle reveal<cr>", { desc = "Explorer (Neo-tree)" })

-- Optional: if you use :Ex in command-line, you can alias it:
vim.api.nvim_create_user_command("Ex", function()
  vim.cmd("Neotree toggle reveal")
end, {})

vim.api.nvim_create_user_command("Explore", function()
  vim.cmd("Neotree toggle reveal")
end, {})

-- Optional: split-like commands using neo-tree
vim.api.nvim_create_user_command("Vex", function()
  vim.cmd("vsplit | Neotree reveal")
end, {})

vim.api.nvim_create_user_command("Sex", function()
  vim.cmd("split | Neotree reveal")
end, {})

vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close current buffer" })
--
-- Make <C-v> enter Visual Block mode again
vim.keymap.set("n", "<C-v>", "<C-v>", { noremap = true, silent = true })
