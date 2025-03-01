return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local LazyVim = require("lazyvim.util")

    -- Modify the file path component in lualine_c (4th position). Refer to lua/lazyvim/util/lualine.lua
    -- Set length=0 to show the full path instead of truncated path
    -- This overrides the default behavior which shows only 3 path segments
    -- For example:
    -- Default (length=3): "src/...components/Button.jsx"
    -- Modified (length=0): "src/ui/components/Button.jsx"
    opts.sections.lualine_c[4] = { LazyVim.lualine.pretty_path({ length = 0 }) }

    return opts
  end,
}
