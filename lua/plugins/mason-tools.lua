local tools = {
  "prettierd",
  "js-debug-adapter",
  "clang-format",
  "gofumpt",
  "goimports",
  "codelldb",
  "delve",
}

if vim.fn.executable("rustup") == 1 then
  table.insert(tools, "rustup")
end

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = tools,
    auto_update = false,
    run_on_start = true,
  },
}
