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
