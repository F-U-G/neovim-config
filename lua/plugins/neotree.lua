return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup({
      vim.keymap.set('n', '<Leader>nt', ':Neotree toggle filesystem left<CR>', {desc = "open/close filetree"}),
      vim.keymap.set('n', '<Leader>nb', ':Neotree toggle buffers right<CR>', {desc = "open/close buffer view"}),
      vim.keymap.set('n', '<Leader>ng', ':Neotree toggle git_status right<CR>', {desc = "open/close git view"}),
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["<C-b>"] = { "scroll_preview", config = {direction = 10} },
          ["<C-f>"] = { "scroll_preview", config = {direction = -10} },
        },
      },
    })
  end,
}
