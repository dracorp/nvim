return {
  {
    --- https://github.com/RRethy/vim-illuminate
    --- illuminate.vim - (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
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
