return {
  --- https://github.com/rbong/vim-flog
  --- A blazingly fast, stunningly beautiful, exceptionally powerful git branch viewer for Vim/Neovim.
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
}
