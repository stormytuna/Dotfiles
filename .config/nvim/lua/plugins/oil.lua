return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
	delete_to_trash = true,
    keymaps = { 
	  ["<bs>"] = { "actions.parent", mode = "n" },
	  ["<esc>"] = { "actions.close", mode = "n" },
	},
	float = {
	  padding = 4,
	  max_height = 60,
	},
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
