-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSPs
vim.lsp.enable({
  'lua_ls',
  'nil_ls',
  --'roslyn_ls',
  'omnisharp',
  'jdtls',
  'html',
  'cssls',
  'zls',
  'ts_ls',
})

vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        -- Get rid of pesky unrecognised 'vim' global
        globals = {
          'vim', 'require'
        }
      },
      workspace = {
        -- Make LSP aware of neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
}

-- Lazy
require('config.lazy')

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.clipboard = 'unnamedplus'
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.winborder = 'single'
vim.o.scrolloff = 10
vim.o.showcmdloc='statusline'

vim.o.ignorecase = true
vim.o.smartcase = true

-- Diagnostics
--vim.diagnostic.config({
--  virtual_text = false, -- Using tiny-inline-diagnostic
--})

-- Keymaps
--vim.keymap.set('n', '<esc>', '<esc>:nohlsearch<cr>:helpclose<cr>')
vim.keymap.set('n', '<cr>', ':noh<cr><cr>')
vim.keymap.set('n', 'U', '<c-r>')
vim.keymap.set('n', '<leader>o', ':update<cr>:source<cr>', {desc = 'reload config'})
vim.keymap.set('n', '<leader>w', ':write<cr>', {desc = 'write'})
vim.keymap.set('n', '<leader>q', ':quit<cr>', {desc = 'quit'})
vim.keymap.set('n', '<leader>e', '<cmd>Oil --float<cr>', {desc = 'oil'})
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', '<a-h>', '<c-w>h')
vim.keymap.set('n', '<a-m>', '<c-w>j')
vim.keymap.set('n', '<a-u>', '<c-w>k')
vim.keymap.set('n', '<a-j>', '<c-w>l')
vim.keymap.set('i', '<a-h>', [[<c-\><c-N><c-w>h]])
vim.keymap.set('i', '<a-m>', [[<c-\><c-N><c-w>j]])
vim.keymap.set('i', '<a-u>', [[<c-\><c-N><c-w>k]])
vim.keymap.set('i', '<a-j>', [[<c-\><c-N><c-w>l]])
vim.keymap.set('t', '<a-h>', [[<c-\><c-N><c-w>h]])
vim.keymap.set('t', '<a-m>', [[<c-\><c-N><c-w>j]])
vim.keymap.set('t', '<a-u>', [[<c-\><c-N><c-w>k]])
vim.keymap.set('t', '<a-j>', [[<c-\><c-N><c-w>l]])

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = 'files'})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {desc = 'grep'})
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', {desc = 'diagnostics'})
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<cr>', {desc = 'resume'})
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope lsp_references<cr>', {desc = 'references'})
vim.keymap.set('n', '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', {desc = 'implementation'})

vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {desc = 'rename'})
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, {desc = 'type definition'})
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {desc = 'code actions'})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {desc = 'format'})
vim.keymap.set('i', '<c-s-space>', vim.lsp.buf.signature_help, {desc = 'signature help'})
vim.keymap.set('i', '<c-bs>', '<c-w>')

local harpoon = require('harpoon')
vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, {desc = 'add'})
vim.keymap.set('n', '<leader>hr', function() harpoon:list():remove() end, {desc = 'remove'})
vim.keymap.set('n', '<leader>hc', function() harpoon:list():clear() end, {desc = 'clear'})
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<C-h>', function() harpoon.list():select(1) end)
vim.keymap.set('n', '<C-t>', function() harpoon.list():select(2) end)

--local term = require('toggleterm.terminal').Terminal:new({
--  direction = 'horizontal',
--  on_open = function (t)
--    vim.cmd('startinsert')
--  end
--})

--vim.keymap.set('n', '<leader>tt', function() term:open() end, {desc = 'terminal'})
--vim.keymap.set('t', '<esc>', [[<c-\><c-n><c-w>p]])
--vim.keymap.set('t', '<c-esc>', '<cmd>ToggleTerm<cr>')
--vim.keymap.set('t', '<c-h>', '<cmd>wincmd h<cr>', {buffer = 0})
--vim.keymap.set('t', '<c-j>', '<cmd>wincmd j<cr>', {buffer = 0})
--vim.keymap.set('t', '<c-k>', '<cmd>wincmd k<cr>', {buffer = 0})
--vim.keymap.set('t', '<c-l>', '<cmd>wincmd l<cr>', {buffer = 0})
--
--local lazygit = require('toggleterm.terminal').Terminal:new({
--  cmd = "lazygit",
--  dir = "git_dir",
--  direction = "float",
--  float_opts = {
--    border = "single",
--  },
--  on_open = function(t)
--    vim.cmd("startinsert!")
--    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--  end,
--  on_close = function(t)
--    vim.cmd("startinsert!")
--  end,
--})
--
--function Lazygit()
--  lazygit:toggle()
--end

local betterTerm = require('betterTerm')
vim.keymap.set({'n', 't'}, '<c-;>', function() betterTerm.open() end, {desc = 'terminal'})

vim.api.nvim_set_keymap("n", "<leader>g", '<cmd>LazyGit<cr>', {desc = "lazygit"})

-- Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- TODO: Fix? Remove? idk
--vim.api.nvim_create_autocmd('LspAttach', {
--	group = vim.api.nvim_create_augroup('autoformat', {}),
--	desc = 'Auto format when saving',
--	callback = function(args)
--		if not client:supports_method('textDocument/willSaveWaitUntil')
--				and client:supports_method('textDocument/formatting') then
--			vim.api.nvim_create_autocmd('BufWritePre', {
--				group = vim.api.nvim.create_augroup('autoformat', { clear = false }),
--				buffer = args.buf,
--				callback = function()
--					vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
--				end
--			})
--		end
--	end,
--})
