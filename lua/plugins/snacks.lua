-- :checkhealth snacks
---@diagnostic disable: undefined-global
return {
  {
    --- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim",
    opts = {
      -- Core Snacks feature toggles.
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 5000,
        top_down = false,
      },
      scroll = { enabled = true },
      animate = { enabled = true },
      dim = { enabled = false },
      -- Image handling and rendering.
      image = {
        enabled = true,
        -- force image rendering, iterm2 supports kitty protocol
        force = true,
        math = {
          enabled = false,
        },
      },
      -- Status column integration.
      statuscolumn = { enabled = true },
      -- GitHub integration.
      gh = { enabled = true },
      -- Git integration.
      git = { enabled = true },
      -- Word navigation and reference helpers.
      words = { enabled = true },
      -- Global Snacks Explorer settings.
      explorer = {
        enabled = true,
        trash = true, -- Use the system trash when deleting files, eg. ~/.Trash
        replace_netrw = true, -- Replace netrw with the snacks explorer
      },
      -- Dashboard layout and sections.
      dashboard = {
        enabled = true,
        sections = {
          -- pane 1
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          {
            icon = "󰙅 ",
            key = "e",
            desc = "Explorer root dir",
            action = function()
              Snacks.explorer({ cwd = LazyVim.root() })
            end,
          },
          {
            icon = "󰙅 ",
            key = "E",
            desc = "Explorer cwd dir",
            action = function()
              Snacks.explorer()
            end,
          },
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
            cmd = "git status --short --branch --renames 2>/dev/null || echo 'not a git repository'",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      -- Picker configuration and source-specific overrides.
      picker = {
        -- Picker sources.
        sources = {
          gh_issue = {
            -- your gh_issue picker configuration comes here
            -- or leave it empty to use the default settings
          },
          gh_pr = {
            -- your gh_pr picker configuration comes here
            -- or leave it empty to use the default settings
          },
          -- Snacks Explorer picker settings.
          explorer = {
            hidden = true,
            follow_file = true,
            auto_close = false,
            diagnostics = true,
            -- Keymaps inside the explorer list window.
            win = {
              -- Result list keymaps.
              list = {
                keys = {
                  ["<Left>"] = "explorer_close",
                  ["<Right>"] = "confirm",
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
          -- Notification preview window tweaks.
          notifications = {
            win = {
              -- Window options for the preview pane.
              wo = {
                wrap = true,
              },
            },
          },
        },
        -- Picker window keymaps and options.
        win = {
          -- Search input keymaps.
          input = {
            keys = {
              ["<PageUp>"] = "list_scroll_up",
              ["<PageDown>"] = "list_scroll_down",
              ["<Home>"] = "list_top",
              ["<End>"] = "list_bottom",
            },
          },
          -- Result list keymaps.
          list = {
            keys = {
              ["<PageUp>"] = "list_scroll_up",
              ["<PageDown>"] = "list_scroll_down",
              ["<Home>"] = "list_top",
              ["<End>"] = "list_bottom",
            },
          },
          -- Shared window options for the picker UI.
          wo = {
            wrap = true,
          },
        },
      },
      keys = {},
    },
    config = function(_, opts)
      -- Load the plugin with the provided options
      require("snacks").setup(opts)
    end,
  },
}
