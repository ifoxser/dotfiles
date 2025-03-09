-- This function turns off the "fixed width" for neo-tree windows
-- so we can make them bigger or smaller
local function disable_neotree_winfix()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) then
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.bo[buf].filetype

      if ft == "neo-tree" and vim.wo[win].winfixwidth then
        if not _G.neotree_winfix_state then
          _G.neotree_winfix_state = {}
        end
        _G.neotree_winfix_state[win] = true
        vim.wo[win].winfixwidth = false
      end
    end
  end
end

-- This function puts back the "fixed width" setting
-- for neo-tree windows after we're done resizing
local function restore_neotree_winfix()
  if _G.neotree_winfix_state then
    for win, was_fixed in pairs(_G.neotree_winfix_state) do
      if vim.api.nvim_win_is_valid(win) and was_fixed then
        vim.wo[win].winfixwidth = true
      end
    end
    _G.neotree_winfix_state = {}
  end
end

-- We need a place to remember which windows had fixed width
-- so we can put the setting back later
if not _G.neotree_winfix_state then
  _G.neotree_winfix_state = {}
end

return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,

  opts = {
    ignored_filetypes = {},
    ignored_buftypes = {},
    at_edge = "stop",
  },

  keys = {
    {
      "<A-h>",
      function()
        disable_neotree_winfix()
        require("smart-splits").resize_left()
        restore_neotree_winfix()
      end,
      desc = "Resize left",
    },
    {
      "<A-j>",
      function()
        disable_neotree_winfix()
        require("smart-splits").resize_down()
        restore_neotree_winfix()
      end,
      desc = "Resize down",
    },
    {
      "<A-k>",
      function()
        disable_neotree_winfix()
        require("smart-splits").resize_up()
        restore_neotree_winfix()
      end,
      desc = "Resize up",
    },
    {
      "<A-l>",
      function()
        disable_neotree_winfix()
        require("smart-splits").resize_right()
        restore_neotree_winfix()
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
