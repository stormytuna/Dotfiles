-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Lazy
require('config.lazy')

-- Options
vim.o.number = true
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.clipboard = 'unnamedplus'
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.winborder = 'single'

vim.o.ignorecase = true
vim.o.smartcase = true

-- Keymaps
vim.keymap.set('n', '<esc>', '<esc>:nohlsearch<cr>:helpclose<cr>')
vim.keymap.set('n', '<leader>o', ':update<cr>:source<cr>')
vim.keymap.set('n', '<leader>w', ':write<cr>')
vim.keymap.set('n', '<leader>q', ':quit<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil --float<cr>')

-- Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
