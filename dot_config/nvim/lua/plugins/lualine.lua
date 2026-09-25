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
      grey = base16_colors.base0C
    }

    local theme = {
      normal = {
        a = { fg = colors.violet, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.blue, bg = colors.black } },
      visual = { a = { fg = colors.cyan, bg = colors.black } },
      replace = { a = { fg = colors.red, bg = colors.black } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    -- TODO: Configure
    lualine.setup({
      options = {
        theme = theme,
      }
    })
  end
}
