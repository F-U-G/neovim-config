return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- required; main doesn't support lazy-loading
    build = ":TSUpdate",
    init = function()
      local ensure_installed = {
        "python",
        "c",
        "cpp",
        "r",
        "lua",
        "java",
        "vim",
        "vimdoc",
        "css",
        "dockerfile",
        "query",
        "html",
        "tsx",
        "typescriptreact",
        "jsx",
        "http",
        "json",
        "yaml",
        "javascript",
        "typescript",
        "markdown",
        "bash",
        "sh",
      }

      -- parser start/install autocmd
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ensure_installed,

        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local lang = vim.treesitter.language.get_lang(ft)

          -- check if parser is available
          if not vim.treesitter.language.add(lang) then
            local available = vim.g.ts_available or require("nvim-treesitter").get_available()
            if not vim.g.ts_available then
              vim.g.ts_available = available
            end

            if vim.tbl_contains(available, lang) then
              -- install treesitter parsers and queries
              local install_msg = string.format("Installing parsers and queries for %s", lang)
              vim.print(install_msg)
              require("nvim-treesitter").install(lang)
            end
          end

          if vim.treesitter.language.add(lang) then
            -- start treesitter highlighting
            vim.treesitter.start(args.buf, lang)
          end
        end,
      })
    end

  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'v',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        }
      })

      local select = require("nvim-treesitter-textobjects.select").select_textobject
      vim.keymap.set({ "x", "o" }, "af", function()
        select("@function.outer", "textobjects")
      end, { desc = "Outer function select" })
      vim.keymap.set({ "x", "o" }, "if", function()
        select("@function.inner", "textobjects")
      end, { desc = "In funciton select" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        select("@class.outer", "textobjects")
      end, { desc = "Select outer class" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        select("@class.inner", "textobjects")
      end, { desc = "Select inner class" })
      vim.keymap.set({ "x", "o" }, "as", function()
        select("@local.scope", "textobjects")
      end, { desc = "Select scope" })
    end
  }
}
