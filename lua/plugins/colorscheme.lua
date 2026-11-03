return {
  --- https://github.com/ellisonleao/gruvbox.nvim
  --- Lua port of the most famous vim colorscheme
  {
    "ellisonleao/gruvbox.nvim",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
