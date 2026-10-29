return {
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    legacy_commands = false,
    picker = {
      name = "telescope.nvim"
    },
    workspaces = {
      {
        name = "aegyalond",
        path = "~/ws/vaults/aegyalond",
      },
      {
        name = "curse of strahd",
        path = "/home/stormytuna/ws/vaults/curse of strahd",
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
    completion = {
      match_case = false,
    },
  },
}
