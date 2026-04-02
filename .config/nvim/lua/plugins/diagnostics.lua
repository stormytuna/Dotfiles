return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  opts = {
    preset = 'classic',
    options = {
      add_messages = {
        display_count = true,
      },
      severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
      },
      multilines = {
        enabled = true,
        always_show = true,
      },
    },
  },
}
