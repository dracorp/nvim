return {
  {
    --- https://github.com/powerman/vim-plugin-AnsiEsc
    "powerman/vim-plugin-AnsiEsc",
    lazy = false,

    init = function()
      local group = vim.api.nvim_create_augroup("ansiesc", { clear = true })

      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = group,
        pattern = { "formula*", "cask*" },
        callback = function()
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(0) then
              vim.cmd("AnsiEsc")
            end
          end)
        end,
      })
    end,
  },
}
