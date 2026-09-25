return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      layout_strategy = 'flex',
      layout_config = {
        vertical = {
          width = 0.9,
          height = 0.9,
          preview_height = 0.6,
          preview_cutoff = 0
        }
      },
      path_display = {
        "smart",
        shorten = { len = 3 }
      },
      wrap_resuls = true
    }
  }
}
