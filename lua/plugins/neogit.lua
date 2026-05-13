return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<CR>",                       desc = "Git: Open Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<CR>",                desc = "Git: Commit" },
    { "<leader>gp", "<cmd>Neogit pull<CR>",                  desc = "Git: Pull" },
    { "<leader>gP", "<cmd>Neogit push<CR>",                  desc = "Git: Push" },
    { "<leader>gb", "<cmd>Neogit branch<CR>",                desc = "Git: Branch" },
    { "<leader>gr", "<cmd>Neogit rebase<CR>",                desc = "Git: Rebase" },
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    -- open neogit in a floating window
    kind = "split",
  },
}
