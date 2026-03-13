return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit (project root)" },
      { "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)" },
      -- "lg" in normal mode to open LazyGit
      { "lg", "<cmd>LazyGit<cr>", mode = "n", desc = "LazyGit (lg)" },
    },
  },
}
