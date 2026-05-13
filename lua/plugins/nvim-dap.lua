return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "DAP: Continue / start" })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "DAP: Step over" })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "DAP: Step into" })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = "DAP: Step out" })
    vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = "DAP: Terminate" })

    -- codelldb adapter — LLVM/LLDB-based, used for C, C++, and Rust
    local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
      },
    }

    local codelldb_configurations = {
      {
        name = "Launch executable (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
      {
        name = "Attach to process (codelldb)",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.cpp = codelldb_configurations
    dap.configurations.c = codelldb_configurations
    dap.configurations.rust = codelldb_configurations
  end,
}
