return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  config = function()
    require("dap-vscode-js").setup({
      -- mason installs the adapter here
      debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
      debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
    })

    local js_langs = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
    for _, lang in ipairs(js_langs) do
      require("dap").configurations[lang] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file (Node)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch ts-node (current file)",
          runtimeExecutable = "node",
          runtimeArgs = { "--loader", "ts-node/esm" },
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          -- Attach to `node --inspect` or `node --inspect-brk`
          type = "pwa-node",
          request = "attach",
          name = "Attach to process (port 9229)",
          port = 9229,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to process (pick)",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
      }
    end
  end,
}
