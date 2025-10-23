return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- These are for the lsp not in Mason and are installed via the OS
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
      vim.lsp.config(
        "tsserver", {
          cmd = { "typescript-language-server", "--stdio" }
        }
      )
      vim.lsp.enable({"clangd", "pyright", "gdscript", "tsserver"})

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
