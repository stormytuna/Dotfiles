return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["<bs>"] = { "actions.parent", mode = "n" },
      ["<esc>"] = { "actions.close", mode = "n" },
      ["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
    },
    float = {
      padding = 4,
      max_height = 60,
    },
    view_options = {
      is_hidden_file = function(name, _)
	return vim.startswith(name, ".") or vim.endswith(name, ".uid")
      end
    }
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
