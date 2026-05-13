return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "prettierd",
      "js-debug-adapter",
    },
    auto_update = false,
    run_on_start = true,
  },
}
