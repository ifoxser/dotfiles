return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- Set up folders and files
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_pattern = {
        -- Folders we want to hide
        "*.git",
        "*.git*",
        "*.repo",
        "*.cache",
        "*_cacache",
        "*.vscode-server",
        -- Files we want to hide
        "*.git*",
        "*.o",
        "*.cmd",
        "*.arm.d",
        "*.arm.o",
        "*.mod",
        "*.mod.c",
      },
    }

    -- Make the Neo-tree window look nice
    opts.filesystem.window = {
      width = "17%",
    }

    return opts
  end,
}
