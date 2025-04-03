return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- require the ones that are not installed through mason
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
}
