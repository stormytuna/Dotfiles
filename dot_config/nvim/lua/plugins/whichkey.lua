return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require('which-key')
    wk.setup({
      preset = "modern",
      icons = {
        breadcrumb = ">",
        separator = ">",
        group = "",
        mappings = false,
      },
    })

    wk.add({
      {'<leader>f', group = "find..."},
      {'<leader>h', group = "harpoon..."},
      {'<leader>l', group = "lsp..."},
    })
  end
}
