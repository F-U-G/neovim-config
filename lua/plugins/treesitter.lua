return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    config = function()
      require("treesitter-modules").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "javascript", "html", "python", "java" },
        auto_install = true,
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- these select nodes in visual mode, figure out better keybinds for these
            init_selection = "<Leader>ps",
            node_incremental = "<Leader>pi",
            scope_incremental = "<Leader>pc",
            node_decremental = "<Leader>pj",
          },
        }
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
            ['@parameter.outer'] = 'v',   -- charwise
            ['@function.outer'] = 'v',    -- linewise
            ['@class.outer'] = '<c-v>',   -- blockwise
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
      end, { desc = "Select inner class" } )
      vim.keymap.set({ "x", "o" }, "as", function()
        select("@local.scope", "textobjects")
      end, { desc = "Select scope" } )
    end
  }
}
