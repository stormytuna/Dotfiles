return {
  "CRAG666/betterTerm.nvim",
  opts = {
    prefix = "TERM",
    bufname_format = function(prefix, index)
      return prefix .. ' [' .. index .. ']'
    end,
    size = 20,
  },
}
