return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      layout_strategy = 'flex',
      layout_config = {
        width = {padding = 3},
        height = {padding = 2},
      },
      path_display = {
        "smart",
        shorten = { len = 3 },
      },
      wrap_resuls = true,
    },
    sorting_strategy = "ascending",
  },
  config = function(_, opts)
    require('telescope').setup(opts)

    local colors = require('base16-colorscheme').colors
    vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = colors.base02, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopeNormal", {fg = colors.base06, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg = colors.base06, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg = colors.base0C, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg = colors.base0C, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePromptCounter", {fg = colors.base02, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = colors.base0C, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {fg = colors.base06, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {fg = colors.base0F, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg = colors.base0F, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopeSelection", {bg = colors.base01})
    vim.api.nvim_set_hl(0, "TelescopeMatching", {fg = colors.base0F})
    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {fg = colors.base0F, bg = colors.base01})
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {fg = colors.base06, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {fg = colors.base0E, bg = colors.base00})
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg = colors.base0E, bg = colors.base00})
  end,
}
