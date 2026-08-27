return {
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },

    ft = { "http" }, -- loads only when you open .http files

    keys = {
      { "<leader>rr", "<cmd>Rest run<CR>",        desc = "Run request under cursor" },
      { "<leader>rp", "<cmd>Rest open<CR>", desc = "Open result pane" },
      { "<leader>rl", "<cmd>Rest last<CR>",    desc = "Run last request" },
    },
  }
}
