return {
  -- add more treesitter parsers
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "bash",
  --       "diff",
  --       "html",
  --       "javascript",
  --       "json",
  --       "lua",
  --       "markdown",
  --       "markdown_inline",
  --       "python",
  --       "query",
  --       "regex",
  --       "vim",
  --       "yaml",
  --       "css",
  --       "latex",
  --       "scss",
  --       "svelte",
  --       "typst",
  --       "vue",
  --     },
  --   },
  -- },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = {
        enable = true,
      }
      opts.indent = {
        enable = true,
      }
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "diff",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
        "css",
        "latex",
        "scss",
        "svelte",
        "typst",
        "vue",
      })
    end,
  },
}
