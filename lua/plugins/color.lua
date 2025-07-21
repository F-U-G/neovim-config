return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require'colorizer'.setup({
      '*'; -- Highlight all filetypes
    }, {
      names = false;
    })
  end
}

-- plugin used to color in hex colors
-- Ex: #cccccc:
