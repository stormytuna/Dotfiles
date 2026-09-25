return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'RRethy/base16-nvim' },
  config = function()
    local lualine = require('lualine')

    local base16_colors = require('base16-colorscheme').colors

    local colors = {
      blue = base16_colors.base0D,
      cyan = base16_colors.base0C,
      black = base16_colors.base00,
      white = base16_colors.base05,
      red = base16_colors.base08,
      violet = base16_colors.base0E,
      grey = base16_colors.base01
    }

    local theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.grey },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    local function macroComponent()
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        return "REC @" .. reg
      end
      return ""
    end

    lualine.setup({
      options = {
        theme = theme,
        component_separators = {left = '|', right = '|'},
        section_separators = {left = '', right = ''},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', 'lsp_status', '%S', macroComponent},
        lualine_x = {'filetype', 'searchcount', 'selectioncount'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      }
    })
  end,
}
