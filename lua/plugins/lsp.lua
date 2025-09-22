return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config(
        "clangd", {},
        "pyright", {
          -- npm i -g pyright
        },
        "gdscript", {
          --cmd = { "nc", "127.0.0.1", "6005" },
          --filetypes = { "gdscript" },
          --root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
        }
      )
      -- require the ones that are not installed through mason
      -- must be installed on OS
      vim.lsp.enable({"clangd", "pyright", "gdscript"})

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
