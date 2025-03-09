return {
  {
    "azabiong/vim-highlighter",
    dependencies = {
      "folke/which-key.nvim",
    },

    -- vim-highlighter globle setting
    init = function()
      vim.g.HiSet = "<leader>hh"
      vim.g.HiErase = "<leader>hr"
      vim.g.HiClear = "<leader>ha"
      vim.g.HiFind = "<leader>hf"
      vim.g.HiSetSL = "<leader>he"
      vim.g.HiSyncMode = 3
      vim.g.HiKeywords = "~/.cache/nvim/highlighter/keywords"
      vim.g.HiFindTool = "rg --color=never --no-heading --column --smart-case"

      -- which-key setting
      local function get_unique_hlname_with_timestamp()
        -- Get the full current file name (including file extension)
        local current_file = vim.fn.expand("%:t")
        if current_file == "" then
          current_file = "unnamed"
        end

        -- Use timestamps as unique identifier
        local timestamp = os.date("%Y%m%d_%H%M%S")

        -- Check HiKeywords path
        local hl_dir = vim.g.HiKeywords or vim.fn.expand("~/.cache/nvim/highlighter/keywords")
        if vim.fn.isdirectory(vim.fn.expand(hl_dir)) == 0 then
          vim.fn.mkdir(vim.fn.expand(hl_dir), "p")
        end

        -- Combine all string
        return string.format("%s_%s.hl", current_file, timestamp)
      end

      local wk = require("which-key")
      wk.add({
        { "<leader>h", group = "Highlighter", mode = { "n", "v" }, icon = "󰸱" },
        { "<leader>hh", desc = "Highlight Word", mode = { "n", "v" }, icon = "󰸱" },
        { "<leader>hr", desc = "Remove Highlight", mode = { "n", "v" }, icon = "󰇾" },
        { "<leader>ha", desc = "Clear All Highliht", mode = { "n", "v" }, icon = "" },
        { "<leader>he", desc = "Highlight Line", mode = { "n", "v" }, icon = "" },
        {
          "<leader>hf",
          function()
            local keys = vim.api.nvim_replace_termcodes(":Hi/Find  %<Left><Left>", true, false, true)
            vim.fn.feedkeys(keys, "n")
          end,
          desc = "Find Highlight",
          mode = { "n", "v" },
          icon = "󰈞",
        },
        {
          --  Cmd ( :Hi <> ) change pattern between <cword> or <cWORD>
          "<leader>ho",
          function()
            vim.cmd("Hi - ")
            -- For some mysterious reason, without this delay the second command won't work properly.
            vim.defer_fn(function()
              vim.cmd("Hi +")
            end, 100)
          end,
          desc = "Highlight Follow",
          mode = { "n", "v" },
          icon = "",
        },
        {
          "<leader>hs",
          function()
            local hl_name = get_unique_hlname_with_timestamp()
            vim.cmd("Hi save " .. hl_name)
          end,
          desc = "Save Highlight",
          mode = { "n", "v" },
          icon = "󰆓",
        },
        {
          "<leader>hl",
          function()
            vim.cmd('call feedkeys(":Hi load ", "n")')
          end,
          desc = "Load Highlight",
          mode = { "n", "v" },
          icon = "󰏗",
        },

        { "gj", "<Cmd>Hi><CR>", desc = "Next Pattern Match", mode = { "n", "v" }, icon = "" },
        { "gk", "<Cmd>Hi<<CR>", desc = "Prev Pattern Match", mode = { "n", "v" }, icon = "" },
        { "gl", "<Cmd>Hi}<CR>", desc = "Next Any highlight", mode = { "n", "v" }, icon = "" },
        { "gh", "<Cmd>Hi{<CR>", desc = "Prev Any highlight", mode = { "n", "v" }, icon = "" },
      })
    end,
  },
}
