-- Disable netrw early
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- ~/.config/nvim/lua/config/options.lua  (or any early-loaded lua file)
