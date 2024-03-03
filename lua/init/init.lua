require('init.remaps')

-- lazy stuff
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
plugins = {
	'craftzdog/solarized-osaka.nvim',
	'lewis6991/gitsigns.nvim'
}
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)



