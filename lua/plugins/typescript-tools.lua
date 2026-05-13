return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  opts = {
    settings = {
      expose_as_code_action = "all",
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      tsserver_max_memory = "auto",
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
  keys = {
    { "<leader>ti", "<cmd>TSToolsAddMissingImports<CR>", desc = "JS/TS: Add missing imports" },
    { "<leader>to", "<cmd>TSToolsOrganizeImports<CR>", desc = "JS/TS: Organize imports" },
    { "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<CR>", desc = "JS/TS: Remove unused imports" },
    { "<leader>tr", "<cmd>TSToolsRenameFile<CR>", desc = "JS/TS: Rename file + update imports" },
    { "<leader>tf", "<cmd>TSToolsFixAll<CR>", desc = "JS/TS: Fix all" },
  },
}
