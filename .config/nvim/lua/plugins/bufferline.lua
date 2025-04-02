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
      "<C-]>",
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
      "<C-[>",
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
      "<C-Del>",
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
