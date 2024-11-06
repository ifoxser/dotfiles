return {
  "akinsho/bufferline.nvim",
  keys = {
    {
      "L",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "H",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
    {
      "<leader>bb",
      "<Cmd>BufferLinePick<CR>",
      desc = "Buffer Line Pick",
    },
    {
      "]b",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "[b",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
    {
      "<leader><delete>",
      LazyVim.ui.bufremove,
      desc = "Close current buffer",
    },
  },
  opts = {
    options = {
      -- separator_style = "thick",
      diagnostics = "",
      -- always_show_bufferline = true,
    },
  },
}
