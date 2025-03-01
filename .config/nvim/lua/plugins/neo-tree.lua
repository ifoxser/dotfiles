return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = {
          -- directories
          "*.git",
          "*.git*",
          "*.repo",
          "*.cache",
          "*_cacache",
          "*.vscode-server",
          -- files
          "*.git*",
          "*.o",
          "*.cmd",
          "*.arm.d",
          "*.arm.o",
          "*.mod",
          "*.mod.c",
        },
      },
      window = {
        width = "17%",
      },
    },
  },
}
