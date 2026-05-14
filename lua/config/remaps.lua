vim.g.mapleader = " "

-- basic vim remaps
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cl", "<cmd>colorscheme tokyonight-day<CR>")
vim.keymap.set("n", "<leader>cd", "<cmd>colorscheme tokyonight-moon<CR>") 
vim.keymap.set("n", "<leader>nb", "<cmd>enew<CR>")    -- new buffer
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")           -- next buffer
vim.keymap.set("n", "[b", "<cmd>bprev<CR>")           -- prev buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>") -- close buffer

-- panel movement remaps
vim.keymap.set("n", "<leader>wh", "<C-w>h") -- move to left panel
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })
