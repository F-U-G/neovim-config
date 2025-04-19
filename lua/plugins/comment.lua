return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
      require('Comment').setup({})
    end
-- use "gcc" to comment out a line
-- use "gc" to comment out in visual mode
}
