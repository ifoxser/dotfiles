return {
  "nvim-telescope/telescope.nvim",
  --  opts = function(_, opts)
  --    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
  --      find_command = function()
  --        if 1 == vim.fn.executable("rg") then
  --          return { "rg", "--files", "--hidden", "--no-ignore", "--color", "never", "-g", "!.git" }
  --        end
  --      end,
  --    })
  --  end,
}
