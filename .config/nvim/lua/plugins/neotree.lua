return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- keep neo-tree focused on current file
        },
      },
      window = {
        position = "left", -- classic explorer position
        width = 30,
      },
    },
  },
}
