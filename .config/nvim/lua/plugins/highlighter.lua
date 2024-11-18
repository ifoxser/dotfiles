return {
  {
    "azabiong/vim-highlighter",
    init = function()
      -- settings
      vim.keymap.set("n", "<CR>", "<Cmd>Hi><CR>", { noremap = true })
      vim.keymap.set("n", "g<CR>", "<Cmd>Hi<<CR>", { noremap = true })
    end,
  },
}
