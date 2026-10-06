return {
  {
    "RRethy/vim-illuminate",
    opts = {
      enabled = false,
      delay = 200,
      providers = {
        "regex",
        "lsp",
        "treesitter",
      },
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "regexp" },
      },
    },
  },
}
