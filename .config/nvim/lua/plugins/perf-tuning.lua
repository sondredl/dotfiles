-- ~/.config/nvim/lua/plugins/perf-tuning.lua
return {
  -- Disable Yanky (biggest cost in your profile)
  { "gbprod/yanky.nvim", enabled = false },

  -- Noice: fancy UI for messages
  { "folke/noice.nvim", enabled = false },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
}
