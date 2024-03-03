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
-- TODO: Figrue out how to lay this out properly with plugins folder. idk.
plugins = 
{
  import = 'plugins',
}
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
require("solarized-osaka")

