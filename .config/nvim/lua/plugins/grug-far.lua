return {
  "MagicDuck/grug-far.nvim",

  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")

        -- Get current filename without path
        local filename = vim.fn.expand("%:t")

        -- Get directory path of current file
        local directory = vim.fn.expand("%:p:h")

        grug.open({
          transient = true,
          prefills = {
            filesFilter = filename ~= "" and filename or nil,
            paths = directory ~= "" and directory or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
}
