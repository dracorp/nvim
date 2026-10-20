return {
  {
    --- https://github.com/zbirenbaum/copilot.lua
    "zbirenbaum/copilot.lua",
    cond = function()
      return vim.fn.executable("copilot-enabled") == 1
    end,
    opts = {
      auth_provider_url = "https://lhg.ghe.com",
      nes = {
        enable = true,
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      copilot_model = "",
      -- filetypes = {
      --   markdown = true,
      --   help = true,
      -- },
    },
  },
}
