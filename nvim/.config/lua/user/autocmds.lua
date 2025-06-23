local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local mygroup = augroup('UserAutocmds', {})

-- Highlight yanked text briefly
autocmd('TextYankPost', {
  group = mygroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- Automatically remove trailing whitespace on save
autocmd('BufWritePre', {
  group = mygroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

