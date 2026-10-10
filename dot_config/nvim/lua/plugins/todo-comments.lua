return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
    keywords = {
      todo = { color = "info"},
      warn = { color = "warning", alt = {"warning"}},
      fix = { color = "error", alt = {"bug", "issue"}},
      note = { color = "hint", alt = {"info"}},
    },
    highlight = {
      keyword = "wide_fg",
    },
  }
}
