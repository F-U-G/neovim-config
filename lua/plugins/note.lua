return {
  "neo451/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  event = "BufReadPre",  -- Triggered when reading a buffer
  cond = function()
    local path = vim.fn.expand("%:p")  -- Get full path of the file
    return path:match("^/home/fug/PARA/") ~= nil
  end,
  opts = {
    workspaces = {
      -- add more if ever needed
      {
        name = "PARA",
        path = "~/PARA",
      },
    },
    completion = {
      nvim_cmp = false, -- if you're using nvim-cmp
    },
    new_notes_location = "current_dir", -- create new notes in current folder
    notes_subdir = "notes", -- optional: default folder for notes
    templates = {
      subdir = "templates", -- if you want to use templates
      date_format = "%Y-%m-%d",
    },
    disable_frontmatter = false, -- allow YAML frontmatter
  },
  ui = {
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      ["!"] = { char = "", hl_group = "ObsidianImportant" },
    },
  },
  keys = {
    { "<leader>oo", "<cmd>ObsidianNew<cr>", desc = "Create new note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Find backlinks" },
    { "<leader>ol", function()
      require("obsidian").util.smart_action()
    end, mode = "n", desc = "Follow link under cursor" },
  }
}
