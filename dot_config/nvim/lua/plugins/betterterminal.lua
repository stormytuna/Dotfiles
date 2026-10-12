return {
  'CRAG666/betterTerm.nvim',
  opts = {
    prefix = 'TERM',
    bufname_format = function(prefix, index)
      return prefix .. ' [' .. index .. ']'
    end,
    size = 20,
    show_tabs = false,
    display = 'float',
    float_config = {
      width = 1.0,
      height = 0.35,
      anchor = 'SW',
      row = 0,
      col = 0,
      border = 'single',
    },
  },
}
