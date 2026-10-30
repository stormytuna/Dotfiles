return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = {
        auto_show = true
      },
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
          },
          columns = { { 'kind_icon', 'kind', gap = 1 }, { 'label', 'label_description', gap = 1 } },
          treesitter = { 'lsp' }
        }
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        markdown = { 'lsp', 'snippets', 'buffer', 'obsidian' },
      },
      providers = {
        obsidian = {
          name = 'obsidian',
          module = 'blink_obsidian',
          opts = {
            min_chars = 2,
            max_items = 50,
          },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" }
}
