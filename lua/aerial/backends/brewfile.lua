---@diagnostic disable: undefined-global

local backend_util = require("aerial.backends.util")
local backends = require("aerial.backends")

local M = {}

M.is_supported = function(bufnr)
  if vim.bo[bufnr].filetype ~= "brew" then
    return false, "Filetype is not brew"
  end

  return true, nil
end

function M.fetch_symbols_sync(bufnr)
  bufnr = bufnr or 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
  local items = {}
  local headings = {}
  local stack = {}

  for lnum, line in ipairs(lines) do
    local hashes, name = line:match("^(##+)%s+(.+)$")
    if hashes then
      local level = #hashes - 1
      while #stack > 0 and stack[#stack].level >= level do
        table.remove(stack)
      end

      local item = {
        kind = "Interface",
        name = name,
        level = level,
        lnum = lnum,
        end_lnum = #lines,
        col = 0,
        end_col = #line,
        parent = stack[#stack],
      }

      if item.parent then
        item.parent.children = item.parent.children or {}
        table.insert(item.parent.children, item)
      else
        table.insert(items, item)
      end

      table.insert(headings, item)
      table.insert(stack, item)
    end
  end

  for index, item in ipairs(headings) do
    for next_index = index + 1, #headings do
      if headings[next_index].level <= item.level then
        item.end_lnum = headings[next_index].lnum - 1
        break
      end
    end
  end

  backends.set_symbols(bufnr, items, {
    backend_name = "brewfile",
    lang = "brew",
  })
end

M.fetch_symbols = M.fetch_symbols_sync

function M.attach(bufnr)
  backend_util.add_change_watcher(bufnr, "brewfile")
end

function M.detach(bufnr)
  backend_util.remove_change_watcher(bufnr, "brewfile")
end

return M
