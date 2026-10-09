-- ~/.config/nvim/lua/plugins/snacks.lua
-- :checkhealth snacks
return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      -- <leader>sn to open the noice dashboard
      -- <leader>n to open the notifications history
      -- g< to open Noice
      notifier = {
        enabled = true,
        timeout = 5000,
        top_down = false,
      },
      scroll = { enabled = true },
      animate = { enabled = true },
      dim = { enabled = false },
      image = {
        enabled = true,
        force = true,
        math = {
          enabled = false,
        },
      },
      statuscolumn = { enabled = true },
      gh = { enabled = true },
      git = { enabled = true },
      words = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          -- pane 1
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          -- pane 2
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      picker = {
        sources = {
          gh_issue = {
            -- your gh_issue picker configuration comes here
            -- or leave it empty to use the default settings
          },
          gh_pr = {
            -- your gh_pr picker configuration comes here
            -- or leave it empty to use the default settings
          },
          explorer = {
            trash = true, -- Use the system trash when deleting files
            replace_netrw = true, -- Replace netrw with the snacks explorer
            enabled = true,
            hidden = true,
            auto_close = false,
            win = {
              list = {
                keys = {
                  ["-"] = "edit_split",
                  ["|"] = "edit_vsplit",
                  ["<CR>"] = "confirm",
                  ["o"] = "confirm",
                  ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                  ["<BS>"] = "explorer_up",
                  ["a"] = "explorer_add",
                  ["d"] = "explorer_del",
                  ["r"] = "explorer_rename",
                  ["c"] = "explorer_copy",
                  ["p"] = "explorer_paste",
                  ["u"] = "explorer_update",
                  ["<C-t>"] = "terminal",
                  ["x"] = "explorer_move",
                  ["y"] = "explorer_yank",
                  ["<c-c>"] = "explorer_cd",
                  ["."] = "explorer_focus",
                  ["I"] = "toggle_ignored",
                  ["H"] = "toggle_hidden",
                  ["Z"] = "explorer_close_all",
                },
              },
            },
          },
          -- https://www.reddit.com/r/neovim/comments/1mvlp86/lazyvim_snacks_picker_how_to_turn_on_preview/
          notifications = {
            win = {
              wo = {
                wrap = true,
              },
            },
          },
        },
        win = {
          input = {
            keys = {
              ["<PageUp>"] = "list_scroll_up",
              ["<PageDown>"] = "list_scroll_down",
              ["<Home>"] = "list_top",
              ["<End>"] = "list_bottom",
            },
          },
          list = {
            keys = {
              ["<PageUp>"] = "list_scroll_up",
              ["<PageDown>"] = "list_scroll_down",
              ["<Home>"] = "list_top",
              ["<End>"] = "list_bottom",
            },
          },
        },
      },
      keys = {
        {
          "<leader>sp",
          function()
            Snacks.notifier.show_history()
          end,
          desc = "Show notifs",
        },
        {
          "<leader>gi",
          function()
            Snacks.picker.gh_issue()
          end,
          desc = "GitHub Issues (open)",
        },
        {
          "<leader>gI",
          function()
            Snacks.picker.gh_issue({ state = "all" })
          end,
          desc = "GitHub Issues (all)",
        },
        {
          "<leader>gp",
          function()
            Snacks.picker.gh_pr()
          end,
          desc = "GitHub Pull Requests (open)",
        },
        {
          "<leader>gP",
          function()
            Snacks.picker.gh_pr({ state = "all" })
          end,
          desc = "GitHub Pull Requests (all)",
        },
      },
    },
    config = function(_, opts)
      -- Load the plugin with the provided options
      require("snacks").setup(opts)
    end,
  },
}
