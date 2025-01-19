return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    -- Ensure opts table exists to prevent nil access
    opts = opts or {}

    -- Merge grep configurations while preserving existing settings
    opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
      RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
    })

    -- Merge files configurations while preserving existing settings
    opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
      fd_opts = [[--color=never --type f]],
    })

    return opts
  end,
}
