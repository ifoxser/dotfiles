return {
  "stevearc/aerial.nvim",
  opts = {
    layout = {
      max_width = { nil },
      width = 0.18,
      default_direction = "right",
      placement = "edge",
    },
    attach_mode = "global",
    close_automatic_events = { "unsupported", "switch_buffer", "unfocus" },
    open_automatic = function(bufnr)
      return require("aerial").num_symbols(bufnr) > 0
    end,
  },
}
