return {
  {
    "mbbill/undotree",

    keys = {
      { "<leader><F8>", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },

    config = function()
      ----------------------------------------
      -- Undo Persistence Configuration
      ----------------------------------------
      -- Setup directory for storing undo persistent files
      local target_path = vim.fn.expand("~/.cache/nvim/undotree")

      -- Make sure the undo directory exists
      if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", "755")
      end

      -- Config where to store undo files
      vim.opt.undodir = target_path

      -- Enable persistent undo history
      vim.opt.undofile = true

      ----------------------------------------
      -- Undotree Window Behavior Configuration
      ----------------------------------------
      -- Auto focus on undotree window when opened
      vim.g.undotree_SetFocusWhenToggle = 1

      -- Use layout 3: tree on the right, diff panel at bottom
      vim.g.undotree_WindowLayout = 3

      -- Additional undotree settings
      vim.g.undotree_ShortIndicators = 0 -- Use the long date format
      vim.g.undotree_DiffpanelHeight = 10 -- Set height of diff preview panel
    end,
  },
}
