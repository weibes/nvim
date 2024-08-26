return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
    local dapui = require("dapui").setup()
    local neodev = require("neodev").setup({
      library = { plugins = {"dapui" }, type = true}})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
