return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      -- defaults = {
      --   vimgrep_arguments = {
      --     '--hidden'
      --   }
      -- },
      -- pickers = {
      --   find_files = {
      --     hidden = true,
      --   }
      -- },
      extensions = {
        -- fzf from the fzf-native plugin will use fzf for telescope making it faster
        fzf = {}
      },
    }

    require('telescope').load_extension('fzf')
    require("telescope").load_extension("scope")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Live grep cwd' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search nvim help files' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files in cwd' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search normal mode keymaps' })
    vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Search man pages' })
    vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Search vim.opt' })
    vim.keymap.set('n', '<leader>fl', builtin.lsp_references,
      { desc = 'Open all lsp references to the word under the cursor' })
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files {
        cwd = vim.fn.stdpath('config') -- Search nvim config
      }
    end)
    vim.keymap.set('n', '<leader>fp', function()
      builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy') -- Search lazy plugins
      }
    end)
  end,
}
