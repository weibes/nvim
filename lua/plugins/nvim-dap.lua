return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "DAP: Continue / start" })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "DAP: Step over" })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "DAP: Step into" })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = "DAP: Step out" })
    vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = "DAP: Terminate" })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "DAP: Toggle UI" })

    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
  end,
}
