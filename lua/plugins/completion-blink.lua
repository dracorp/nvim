return {
  "saghen/blink.cmp",
  dependencies = { "fang2hou/blink-copilot" },
  opts = {
    keymap = {
      -- https://cmp.saghen.dev/configuration/keymap#presets
      preset = "super-tab", -- "default", "super-tab", "enter", "none"
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
      ["<CR>"] = { "accept", "fallback" },
    },

    completion = {
      ghost_text = {
        enabled = false,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
  },
}
