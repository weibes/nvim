return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-go").setup({
      delve = {
        path = vim.fn.stdpath("data") .. "/mason/bin/dlv",
      },
    })

    vim.keymap.set('n', '<leader>dT', function() require("dap-go").debug_test() end,
      { desc = "DAP (Go): Debug nearest test" })
  end,
}
