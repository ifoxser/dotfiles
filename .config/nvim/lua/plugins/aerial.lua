return {
  "stevearc/aerial.nvim",
  opts = {
    layout = {
      max_width = { nil },
      width = 0.16,
      default_direction = "right",
      placement = "edge",
    },
    attach_mode = "global",

    -- Custom auto-open behavior for Aerial
    -- Opens the Aerial sidebar when first loading a file containing symbols
    open_automatic = function(bufnr)
      -- Create a global flag to track if we've already auto-opened aerial in this Neovim session
      if vim.g.aerial_has_opened_automatically == nil then
        vim.g.aerial_has_opened_automatically = false
      end

      -- Check if current file has any symbols
      local has_symbols = require("aerial").num_symbols(bufnr) > 0

      -- Only auto-open for the first file with symbols in each Neovim session
      if has_symbols and not vim.g.aerial_has_opened_automatically then
        -- Mark that we've auto-opened aerial once in this session
        vim.g.aerial_has_opened_automatically = true
        return true
      end

      -- Don't auto-open in other cases
      return false
    end,
  },
}
