require("user.options")
require("user.keymaps")
require("user.autocmds")
require("user.plugins.init")


-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from your plugin specs folder
require("lazy").setup({
  { import = "user.plugins" }
})

