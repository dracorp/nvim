return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window Left" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window Down" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window Up" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window Right" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Window Previous" },
    },
  },
}
