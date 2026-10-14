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
      width = 0.95,
      height = 0.65,
      anchor = nil,
      row = nil,
      col = nil,
      border = 'single',
    },
  },
}
