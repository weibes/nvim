return {
  "mfussenegger/nvim-dap",
  config = function()
    require("dap").configurations.lua = {
      {
        type = "nlua",
        request = "launch",
        name = "Lua",
        program = "${file}",
      },
    }
  end,
}
