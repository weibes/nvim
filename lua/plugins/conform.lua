return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript      = { "prettierd", "prettier", stop_after_first = true },
      typescript      = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json            = { "prettierd", "prettier", stop_after_first = true },
      c               = { "clang-format" },
      cpp             = { "clang-format" },
      go              = { "goimports", "gofumpt" },
      rust            = { "rustup" },
    },
  },
}
