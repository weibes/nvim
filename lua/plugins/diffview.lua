return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>",               desc = "Git: Diff view (working tree)" },
    { "<leader>gD", "<cmd>DiffviewOpen HEAD~1<CR>",        desc = "Git: Diff view (vs last commit)" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>",      desc = "Git: File history (current file)" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<CR>",        desc = "Git: File history (whole repo)" },
    { "<leader>gx", "<cmd>DiffviewClose<CR>",              desc = "Git: Close diff view" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        -- 3-way merge layout: LOCAL | BASE | REMOTE, result below
        layout = "diff3_mixed",
      },
    },
  },
}
