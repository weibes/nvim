vim.g.mapleader = " "

-- basic vim remaps
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cl", "<cmd>colorscheme tokyonight-day<CR>")
vim.keymap.set("n", "<leader>cd", "<cmd>colorscheme tokyonight-moon<CR>") 
vim.keymap.set("n", "<leader>nt", "<cmd>tabnew<CR>") 

-- panel movement remaps
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
