return {
  "akinsho/bufferline.nvim",
  keys = {
    {
      "<leader>bb",
      "<Cmd>BufferLinePick<CR>",
      desc = "Buffer Line Pick",
    },
    {
      "]<space>",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "[<space>",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
    {
      "<leader><delete>",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Close current buffer",
    },
    {
      "<A-]>",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "<A-[>",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
    {
      "<A-Del>",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Close current buffer",
    },
  },
  opts = {
    options = {
      diagnostics = "",
      always_show_bufferline = true,
    },
  },
}
