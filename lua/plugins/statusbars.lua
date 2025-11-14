return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          numbers = 'ordinal',
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })
    end
  },
  {
    "tiagovla/scope.nvim",
    config = true
    -- scope has an extension that supports telescope, it allows telescope to search all buffers open in all tabs
    -- require("telescope").load_extension("scope")
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({})
      if os.getenv('TMUX') then
        vim.defer_fn(function() vim.o.laststatus = 0 end, 0)
      end
    end,
  },
  {
    'vimpostor/vim-tpipeline',
    config = function()
      vim.g.tpipeline_fillcentre = 1
      -- vim.api.nvim_create_autocmd('ExitPre', {
      --   desc = 'Update tmux status bar before exiting neovim to change the color back to the term color',
      --   callback = function()
      --     vim.call('tpipeline#update', {})
      --     vim.g.tpipeline_fillcentre = 0
      --     -- vim.g.tpipeline.update()
      --   end
      -- })
      -- :h bufferline-configuration
    end
  }
}
