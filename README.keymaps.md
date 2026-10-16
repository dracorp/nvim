# Keymaps in This Setup

Use `vim.keymap.set` for all custom mappings. Keep the style uniform so the file stays easy to scan.

## Rule Of Thumb

Use a string on the right-hand side when the mapping only runs a command, for example `"<cmd>LazyExtras<cr>"` or `"<cmd>Profile<cr>"`.

Use a Lua function when the mapping needs real logic, a Lua API call, or parameters that are easier to express in code. The diagnostic mapping is a good example because it calls `vim.diagnostic.jump({ count = 1, float = true })`.

## Vim Terms

In Vim, a motion is a cursor movement that can be combined with an operator. Typical motions are `w`, `b`, `e`, `$`, `gg`, `G`, `f`, and `t`.

An operator is an action such as delete, yank, or change. Common operators are `d`, `y`, and `c`. For example, `dw` means delete a word and `ciw` means change inner word.

A command is something executed through `:` or `<cmd>...<cr>`. In this setup, `"<cmd>LazyExtras<cr>"`, `"<cmd>Profile<cr>"`, and `"<cmd>Lazy sync<cr>"` are commands.

A mapping is your custom shortcut. It can trigger a motion, a command, or a Lua function, but the mapping itself is not a motion.

On this config, `<S-Left>`, `<S-Down>`, `<S-Up>`, and `<S-Right>` are mappings that send window commands like `<C-w>h` and `<C-w>j`. `<A-Down>` and `<A-Up>` are mappings that run `:m` or `:move`. `<C-j>` runs a Lua function. None of those are motions by themselves.

## Suggested Pattern

Keep one local alias and one shared options table:

```lua
local map = vim.keymap.set
local opts = { silent = true }

map("n", "<leader>x", "<cmd>Something<cr>", { desc = "Run Something" })
map("n", "<leader>y", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)
```

`noremap` does not need to be set explicitly because `vim.keymap.set` already uses non-recursive mappings by default.

## Where which-key Fits

which-key is for discoverability and grouping, not for replacing normal keymap definitions.

In this setup, the active which-key config is in [lua/plugins/which-key.lua](lua/plugins/which-key.lua). It declares prefix groups like `<leader>U` and `<leader>C`, so those prefixes show up nicely in the menu.


## Practical Split

- Put normal mappings in [lua/config/keymaps.lua](lua/config/keymaps.lua).
- Put prefix groups and descriptions in [lua/plugins/which-key.lua](lua/plugins/which-key.lua).
- Use a Lua function only when the action cannot be expressed cleanly as a simple Ex command string.
