-- Bootstraps lazy.nvim (plugin manager) and loads every file in lua/plugins/
-- To add a plugin later: just create a new file in lua/plugins/ that returns
-- a spec table. Lazy will pick it up automatically — no need to edit this file.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" }, -- auto-loads every spec file under lua/plugins/
  },
  install = { colorscheme = { "kanagawa" } },
  checker = { enabled = false }, -- set true if you want auto update notifications
})
