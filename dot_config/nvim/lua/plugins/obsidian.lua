return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "aegyalond",
        path = "~/ws/vaults/aegyalond",
      },
      {
        name = "curse of strahd",
        path = "~/ws/vaults/curse of strahd",
      },
      {
        name = "personal",
        path = "~/ws/vaults/personal",
      },
      {
        name = "work",
        path = "~/ws/vaults/work",
      },
    },
  },
}
