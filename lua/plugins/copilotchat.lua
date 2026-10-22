return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      -- opts.model = "gpt-5-luna"
      vim.keymap.set("n", "<leader>ccq", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, {
            resources = {
              "buffer",
            },
          })
        end
      end, { desc = "CopilotChat - Quick chat" })
    end,
  },
}
