return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "folke/neodev.nvim"
  },
  config = function()
    require("dapui").setup()
  end
}
