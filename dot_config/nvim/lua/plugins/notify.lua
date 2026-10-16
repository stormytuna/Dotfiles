return {
  'rcarriga/nvim-notify',
  opts = {
    render = "wrapped-compact",
    timeout = 2000,
    max_width = 40,
    stages = "static",
    icons = {
      DEBUG = "DEBUG:",
      ERROR = "ERROR:",
      INFO = "INFO:",
      TRACE = "TRACE:",
      WARN = "WARN:",
    }
  }
}
