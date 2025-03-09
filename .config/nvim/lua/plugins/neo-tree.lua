return {
  "nvim-neo-tree/neo-tree.nvim",
  -- commit = "e6f5b5e044ba9f380e82fc942212e0679d83b6f6",
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

    -- Set up special actions when things happen
    opts.event_handlers = opts.event_handlers or {}

    -- When Neo-tree window opens, do this:
    table.insert(opts.event_handlers, {
      event = "neo_tree_window_after_open",
      handler = function(args)
        -- Let the window change size if we want
        vim.api.nvim_set_option_value("winfixwidth", false, { win = args.winid })
      end,
    })

    -- When Neo-tree window changes size, do this:
    table.insert(opts.event_handlers, {
      event = "neo_tree_window_after_resize",
      handler = function(args)
        -- Make sure we can still change the window size
        vim.api.nvim_set_option_value("winfixwidth", false, { win = args.winid })
      end,
    })

    return opts
  end,
}
