-- version: 3.2.0

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------
-- General
--------------------------------------------------------------------
keymap("n", "<Esc>", ":noh<CR>", opts)            -- Clear search highlights
keymap({ "n", "x" }, "<leader>y", '"+y', opts)    -- Copy to system clipboard
keymap({ "n", "x" }, "<leader>p", '"+p', opts)    -- Paste from system clipboard
keymap({ "n", "x" }, "<leader>P", '"+P', opts)    -- Paste before cursor from clipboard
keymap("n", "<leader>w", ":w<CR>", opts)          -- Save file
keymap("n", "<leader>q", ":q<CR>", opts)          -- Quit
keymap("n", "<leader>Q", ":q!<CR>", opts)         -- Force quit
keymap("i", "jj", "<Esc>", opts)                  -- Fast escape
keymap("i","<leader>j","<Esc>",opts)
--------------------------------------------------------------------
-- Cursor Movement
--------------------------------------------------------------------
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

--------------------------------------------------------------------
-- Window Management
--------------------------------------------------------------------
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)
keymap("n", "<leader><Up>", ":resize +2<CR>", opts)
keymap("n", "<leader><Down>", ":resize -2<CR>", opts)
keymap("n", "<leader><Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<leader><Right>", ":vertical resize +2<CR>", opts)

--------------------------------------------------------------------
-- Buffer Management
--------------------------------------------------------------------
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

--------------------------------------------------------------------
-- Visual Mode
--------------------------------------------------------------------
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

--------------------------------------------------------------------
-- Terminal
--------------------------------------------------------------------
keymap("n", "<leader>tt", ":split | terminal<CR>", opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

--------------------------------------------------------------------
-- Neo-tree
--------------------------------------------------------------------
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)
keymap("n", "<leader>gs", ":Neotree git_status<CR>", opts)
keymap("n", "<leader>ga", "Neotree git_status | lua require('neo-tree.sources.git_status').commands.git_add_all()", opts)
keymap("n", "<leader>gu", ":Neotree git_status | lua require('neo-tree.sources.git_status').commands.git_unstage_file()", opts)
keymap("n", "<leader>gc", ":Neotree git_status | lua require('neo-tree.sources.git_status').commands.git_commit()", opts)

--------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

--------------------------------------------------------------------
-- Treesitter
--------------------------------------------------------------------
keymap("n", "<leader>z", "za", opts)

--------------------------------------------------------------------
-- LSP
-----------------keymap("n", "<leader>k", vim.lsp.buf.hover, opts)-----------------------------------------------
 keymap("n", "<leader>k", vim.lsp.buf.hover, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, opts)

--------------------------------------------------------------------
-- Diagnostics
--------------------------------------------------------------------
keymap("n", "<leader>ld", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts)
keymap("n", "<leader>dt", function()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, opts)

--------------------------------------------------------------------
-- DAP
--------------------------------------------------------------------
keymap("n", "<F5>", function() require("dap").continue() end, opts)
keymap("n", "<F10>", function() require("dap").step_over() end, opts)
keymap("n", "<F11>", function() require("dap").step_into() end, opts)
keymap("n", "<F12>", function() require("dap").step_out() end, opts)
keymap("n", "<leader>db", function() require("dap").toggle_breakpoint() end, opts)
keymap("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)

--------------------------------------------------------------------
-- Gitsigns
--------------------------------------------------------------------
keymap("n", "<leader>gbl", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>gdf", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>gph", ":Gitsigns preview_hunk<CR>", opts)

--------------------------------------------------------------------
-- Trouble
--------------------------------------------------------------------
keymap("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", opts)
keymap("n", "<leader>xr", ":Trouble lsp_references<CR>", opts)
keymap("n", "<leader>xq", ":Trouble quickfix<CR>", opts)

--------------------------------------------------------------------
-- Completion (no <Tab>, only Ctrl+y to confirm)
--------------------------------------------------------------------
-- Using nvim-cmp with <C-y> only
vim.cmd([[
  imap <silent><expr> <C-y> pumvisible() ? "\<C-y>" : "\<C-y>"
  imap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
  imap <silent><expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"
  imap <silent> <C-e> <cmd>lua require('cmp').close()<CR>
  imap <silent> <C-Space> <cmd>lua require('cmp').complete()<CR>
]])

