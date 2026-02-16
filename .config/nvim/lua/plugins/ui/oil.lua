return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent",
      },
      view_options = {
        show_hidden = true, -- always show dotfiles
      },
    },
    keys = {
      {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open parent directory",
      },
    },
    lazy = false,
    dependencies = { { "nvim-mini/mini.icons" } },
  },
}
