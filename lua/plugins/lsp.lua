return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- require the ones that are not installed through mason
      -- must be installed on OS
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({}) -- npm i -g pyright
      lspconfig.gdscript.setup {
        cmd = { "nc", "127.0.0.1", "6005" },
        filetypes = { "gdscript" },
        root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
      }
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
    end,
  },
}
