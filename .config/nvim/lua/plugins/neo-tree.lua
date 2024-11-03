return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        -- visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = {
          ".github*",
          ".gitignore*",
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
