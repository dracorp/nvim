-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<S-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<S-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<S-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<S-Right>", "<C-w>l", { desc = "Go to right window" })

local keymap = vim.keymap

---@class MyPluginOpts
---@field noremap boolean
---@field silent boolean
---@type MyPluginOpts
local opts = { noremap = true, silent = true }

-- Language profile
keymap.set("n", "<leader>P", "<cmd>Profile<cr>", { desc = "Manage language profile" })

-- Moving text
-- Move text up and down
keymap.set("n", "<C-Down>", "<Esc>:m .+1<CR>", opts)
keymap.set("n", "<C-Up>", "<Esc>:m .-2<CR>", opts)
keymap.set("v", "<C-Down>", ":m .+1<CR>", opts)
keymap.set("v", "<C-Up>", ":m .-2<CR>", opts)
keymap.set("x", "<C-Down>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<C-Up>", ":move '<-2<CR>gv-gv", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

-- dashboard
vim.keymap.set("n", "<leader>Ud", function()
  Snacks.dashboard()
end, { desc = "Dashboard" })

vim.api.nvim_create_user_command("Dashboard", function()
  Snacks.dashboard()
end, { desc = "Open Snacks dashboard" })

vim.keymap.set("n", "<leader>Ud", function()
  Snacks.dashboard()
end, { desc = "Dashboard" })

vim.keymap.set("n", "<leader>Ue", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })

-- kubernetes
-- ~/.config/nvim/lua/config/keymaps.lua
-- local kube_utils_mappings = {
--   { "<leader>k", group = "Kubernetes" }, -- Main title for all Kubernetes related commands
--   -- Helm Commands
--   { "<leader>kh", group = "Helm" },
--   { "<leader>khT", "<cmd>HelmDryRun<CR>", desc = "Helm DryRun Buffer" },
--   { "<leader>khb", "<cmd>HelmDependencyBuildFromBuffer<CR>", desc = "Helm Dependency Build" },
--   { "<leader>khd", "<cmd>HelmDeployFromBuffer<CR>", desc = "Helm Deploy Buffer to Context" },
--   { "<leader>khr", "<cmd>RemoveDeployment<CR>", desc = "Helm Remove Deployment From Buffer" },
--   { "<leader>kht", "<cmd>HelmTemplateFromBuffer<CR>", desc = "Helm Template From Buffer" },
--   { "<leader>khu", "<cmd>HelmDependencyUpdateFromBuffer<CR>", desc = "Helm Dependency Update" },
--   -- Kubectl Commands
--   { "<leader>kk", group = "Kubectl" },
--   { "<leader>kkC", "<cmd>SelectSplitCRD<CR>", desc = "Download CRD Split" },
--   { "<leader>kkD", "<cmd>DeleteNamespace<CR>", desc = "Kubectl Delete Namespace" },
--   { "<leader>kkK", "<cmd>OpenK9s<CR>", desc = "Open K9s" },
--   { "<leader>kka", "<cmd>KubectlApplyFromBuffer<CR>", desc = "Kubectl Apply From Buffer" },
--   { "<leader>kkc", "<cmd>SelectCRD<CR>", desc = "Download CRD" },
--   { "<leader>kkk", "<cmd>OpenK9sSplit<CR>", desc = "Split View K9s" },
--   { "<leader>kkl", "<cmd>ToggleYamlHelm<CR>", desc = "Toggle YAML/Helm" },
--   -- Logs Commands
--   { "<leader>kl", group = "Logs" },
--   { "<leader>klf", "<cmd>JsonFormatLogs<CR>", desc = "Format JSON" },
--   { "<leader>klv", "<cmd>ViewPodLogs<CR>", desc = "View Pod Logs" },
-- }
-- -- Register the Kube Utils keybindings
-- require("which-key").add(kube_utils_mappings)

vim.keymap.set("v", "<LeftRelease>", '"+ygv', {
  silent = true,
  desc = "Copy mouse selection to clipboard",
})
