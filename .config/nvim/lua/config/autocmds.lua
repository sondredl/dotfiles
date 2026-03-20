-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Helper: close ALL snaps_picker_list windows (the unwanted "Explorer")
local function close_snaps_picker_windows()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "snaps_picker_list" then
      vim.api.nvim_win_close(win, true)
    end
  end
end

-- 1. Close on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = close_snaps_picker_windows,
})

-- 2. Also close whenever any window is created
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinNew", "WinEnter" }, {
  callback = close_snaps_picker_windows,
})
-- ~/.config/nvim/lua/config/autocmds.lua
-- or ~/.config/nvim/lua/config/options.lua
-- or any file you know runs on startup
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- example: darker gray bg, light fg
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#222222", fg = "#dddddd" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1a1a1a", fg = "#888888" })
  end,
})
--  vim.api.nvim_create_autocmd("ColorScheme", {
--    callback = function()
--      local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
--      -- Make NormalNC a bit darker
--      vim.api.nvim_set_hl(0, "NormalNC", {
--        bg = normal.bg,
--        fg = normal.fg and string.format("#%06x", math.floor(0.8 * tonumber(normal.fg:sub(2), 16))) or normal.fg,
--      })
--    end,
--  })
