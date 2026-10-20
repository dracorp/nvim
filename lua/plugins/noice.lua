return {
  {
    --- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    enabled = true,
    -- <leader>sn to open the noice dashboard
    -- <leader>n to open the notifications history
    -- g< to open Noice
    require("noice").setup({
      views = {
        notify = {
          merge = false,
          replace = false,
        },
      },
    }),
  },
}
