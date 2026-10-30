return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      legacy_commands = false,
      picker = {
        name = "telescope.nvim"
      },
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "aegyalond",
          path = "~/ws/vaults/aegyalond",
        },
        {
          name = "curse of strahd",
          path = "/home/stormytuna/ws/vaults/curse of strahd",
        },
        {
          name = "personal",
          path = "~/ws/vaults/personal",
        },
        {
          name = "work",
          path = "~/ws/vaults/work",
        },
      },
      completion = {
        match_case = false,
      },
      checkbox = {
        order = {" ", "x"},
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim',
      'RRethy/base16-nvim', -- ensures base16 setup() (which populates .colors) runs first
    },
    config = function()
      local colors = require('base16-colorscheme').colors

      require('render-markdown').setup({
        anti_conceal = {
          ignore = {
            link = true,
          },
        },
        completions = {
          blink = {
            enabled = true
          },
        },
        heading = {
          icons = {},
        },
        bullet = {
          icons = { '-', '*', '>' }
        },
        checkbox = {
          enabled = false,
        },
        link = {
          wiki = {
            icon = "",
            scope_highlight = "RenderMarkdownLink",
          },
          image = "",
          email = "",
          hyperlink = "",
        },
        sign = {
          enabled = false,
        },
      })

      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = colors.base08 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = colors.base09 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = colors.base0A })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = colors.base0B })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = colors.base0C })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = colors.base0D })
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = colors.base08 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = colors.base09 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = colors.base0A })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = colors.base0B })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = colors.base0C })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = colors.base0D })
      vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = colors.base08 })

      local heading_levels = {
        ['@markup.heading.1.markdown'] = colors.base08,
        ['@markup.heading.2.markdown'] = colors.base09,
        ['@markup.heading.3.markdown'] = colors.base0A,
        ['@markup.heading.4.markdown'] = colors.base0B,
        ['@markup.heading.5.markdown'] = colors.base0C,
        ['@markup.heading.6.markdown'] = colors.base0D,
      }
      for group, color in pairs(heading_levels) do
        vim.api.nvim_set_hl(0, group, { fg = color })
      end
    end,
  },
}
