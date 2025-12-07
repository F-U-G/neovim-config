return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          numbers = 'ordinal',
          -- offsets = {
          --   {
          --     filetype = "neo-tree",
          --     text = "File Explorer",
          --     text_align = "left",
          --     separator = true,
          --   },
          -- },
        }
      })
    end
  },
  {
    "tiagovla/scope.nvim",
    config = true
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          section_separators = '',
          component_separators = '',
        },
      })
      vim.o.laststatus = 3
      -- if os.getenv('TMUX') then
        -- require('lualine').setup({
        --   options = {
        --     globalstatus = false
        --   }
        -- })
      --   vim.defer_fn(function() vim.o.laststatus = 0 end, 0)
      -- end
    end,
  },
  -- {
  --   'vimpostor/vim-tpipeline',
  --   config = function()
  --     vim.g.tpipeline_fillcentre = 1
      -- vim.g.tpipeline_restore = 1
      -- vim.g.tpipeline_clearstl = 1
      -- vim.g.tpipeline_no_mappings = 1
      -- vim.g.tpipeline_statusline = 0
    -- end
  -- }
}
