return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = '50%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
        border = {
          style = 'single'
        }
      },
      hover = {
        border = {
          style = 'single',
          padding = { 0, 0 },
        },
        position = {
          row = 2,
          col = 0,
        },
      }
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim'
  }
}
