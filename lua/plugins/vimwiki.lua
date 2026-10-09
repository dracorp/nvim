return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        { path = "~/Documents/wiki", syntax = "markdown", ext = ".md", name = "Private" },
        {
          path = "~/Projects/Projects-other/github.com/koalaman/shellcheck.wiki/",
          syntax = "markdown",
          ext = ".md",
          name = "ShellCheck",
        },
        {
          path = "~/Projects/Projects-other/herrbischoff.com/code/me/awesome-macos-command-line/",
          syntax = "markdown",
          ext = ".md",
          name = "Awesome macOS Command Line",
        },
        {
          path = "~/Projects/Projects-other/herrbischoff.com/code/me/awesome-command-line-apps/",
          syntax = "markdown",
          ext = ".md",
          name = "Awesome Command Line Apps",
        },
        {
          path = "~/Projects/Projects-other/markdown-here.wiki",
          syntax = "markdown",
          ext = ".md",
          name = "Markdown Here",
        },
        {
          path = "~/Projects/Projects-other/github.com/adam-p/markdown-here.wiki",
          syntax = "markdown",
          ext = ".md",
          name = "Markdown Here (Adam P)",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
    config = function(_, opts)
      local map = vim.keymap.set

      local function open_wiki(index)
        local wiki = vim.g.vimwiki_list[index]
        if not wiki then
          return
        end

        local path = vim.fn.expand(wiki.path)
        local index_file = path .. "/index.md"

        if vim.fn.filereadable(index_file) == 1 then
          vim.cmd("edit " .. vim.fn.fnameescape(index_file))
          return
        end

        -- Użyj istniejącego Explorera, jeśli jest otwarty.
        local picker = Snacks.picker.get({ source = "explorer" })[1]

        if picker then
          picker:set_cwd(path)
          picker:refresh()
        else
          Snacks.explorer({ cwd = path, enter = false })
        end
      end
      -- Przejście do linku
      map("n", "<leader>wf", "<Plug>VimwikiSplitLink", {
        desc = "VimWiki: follow link (split)",
      })

      map("n", "<leader>wv", "<Plug>VimwikiVSplitLink", {
        desc = "VimWiki: follow link (vsplit)",
      })

      -- Indeks w pionowym podziale
      map("n", "<leader>vs", "<cmd>vsplit | VimwikiIndex<CR>", {
        desc = "VimWiki: index (vsplit)",
      })

      -- Linkify
      map("n", "<leader>uu", "<cmd>call vimwiki#base#linkify()<CR>", {
        silent = true,
        desc = "VimWiki: linkify",
      })

      -- Wybór wiki
      map("n", "<leader>ws", function()
        local items = {}

        for i, wiki in ipairs(vim.g.vimwiki_list) do
          table.insert(items, {
            text = wiki.name or wiki.path,
            wiki = i,
            path = vim.fn.expand(wiki.path),
          })
        end

        Snacks.picker.pick({
          title = "VimWiki",
          items = items,

          format = function(item)
            return {
              { tostring(item.wiki), "Number" },
              { "  " },
              { item.text, "String" },
              { "  " },
              { item.path, "Comment" },
            }
          end,

          confirm = function(picker, item)
            picker:close()
            open_wiki(item.wiki)
          end,
        })
      end, {
        desc = "VimWiki: select wiki",
      })
    end,
  },
}
