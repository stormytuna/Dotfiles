-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSPs
vim.lsp.enable({ 'lua_ls', 'nil_ls', 'roslyn_ls' })

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
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.clipboard = 'unnamedplus'
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.winborder = 'single'

vim.o.ignorecase = true
vim.o.smartcase = true

-- Diagnostics
vim.diagnostic.config({ virtual_lines = true })

-- Keymaps
vim.keymap.set('n', '<esc>', '<esc>:nohlsearch<cr>:helpclose<cr>')
vim.keymap.set('n', 'U', '<c-r>')
vim.keymap.set('n', '<leader>o', ':update<cr>:source<cr>')
vim.keymap.set('n', '<leader>w', ':write<cr>')
vim.keymap.set('n', '<leader>q', ':quit<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil --float<cr>')

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')

vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('i', '<c-s-space>', vim.lsp.buf.signature_help)

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
