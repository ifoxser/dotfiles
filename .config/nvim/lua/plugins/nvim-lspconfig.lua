return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          virtual_text = false,
        },
      }

      -- LSP keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<Leader>ck", vim.lsp.buf.hover, desc = "Hover Documentation" }
    end,
  },
}
