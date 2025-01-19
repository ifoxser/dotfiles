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
        },
      },
    },
  },
  -- keys = {
  --   {
  --     "<leader>sO",
  --     "<cmd>Neotree document_symbols<cr>",
  --     desc = "Document Symbols (Neo-tree)",
  --   },
  -- },
}
