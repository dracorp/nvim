return {
  {
    --- https://github.com/rhysd/git-messenger.vim
    --- Vim and Neovim plugin to reveal the commit messages under the cursor
    "rhysd/git-messenger.vim",
    enable = false,
    cmd = "GitMessenger",
    keys = {
      {
        "<leader>gm",
        "<cmd>GitMessenger<cr>",
        desc = "Git Messenger",
      },
    },
  },
}
