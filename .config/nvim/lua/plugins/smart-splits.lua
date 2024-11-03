return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  keys = {
    {
      "<A-h>",
      function()
        require("smart-splits").resize_left()
      end,
      desc = "Resize left",
    },
    {
      "<A-j>",
      function()
        require("smart-splits").resize_down()
      end,
      desc = "Resize down",
    },
    {
      "<A-k>",
      function()
        require("smart-splits").resize_up()
      end,
      desc = "Resize up",
    },
    {
      "<A-l>",
      function()
        require("smart-splits").resize_right()
      end,
      desc = "Resize right",
    },
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move cursor left",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move cursor down",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move cursor up",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move cursor right",
    },
    {
      "<C-A-h>",
      function()
        require("smart-splits").swap_buf_left({ move_cursor = true })
      end,
      desc = "Swap buf left",
    },
    {
      "<C-A-j>",
      function()
        require("smart-splits").swap_buf_down({ move_cursor = true })
      end,
      desc = "Swap buf down",
    },
    {
      "<C-A-k>",
      function()
        require("smart-splits").swap_buf_up({ move_cursor = true })
      end,
      desc = "Swap buf up",
    },
    {
      "<C-A-l>",
      function()
        require("smart-splits").swap_buf_right({ move_cursor = true })
      end,
      desc = "Swap buf right",
    },
  },
}
