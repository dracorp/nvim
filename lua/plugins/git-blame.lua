return {
  {
    --- https://github.com/f-person/git-blame.nvim
    "f-person/git-blame.nvim",
    opts = {
      enabled = false,
      message_template = " <summary> • <date> • <author> ", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 10, -- virtual text start column, check Start virtual text at column section for more options
    },
    keys = {
      {
        "<leader>gb",
        "<cmd>GitBlameToggle<cr>",
        desc = "Git Blame Toggle",
      },
    },
  },
}
