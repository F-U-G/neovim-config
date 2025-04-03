return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  ft = "markdown",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "obsidian",
          path = "~/obsidian",
        },
      },
    })
  end
}
