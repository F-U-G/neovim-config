return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      vim.keymap.set('n', '<Leader>bp', function() require("dap").toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>c', function() require("dap").continue() end)
      vim.keymap.set('n', '<Leader>bs', function() require("dap").step_over() end)
      vim.keymap.set('n', '<Leader>bi', function() require("dap").step_into() end)
      vim.keymap.set('n', '<Leader>bo', function() require("dap").setp_out() end)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require('dapui').setup()
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },
  {
    'mfussenegger/nvim-dap-python',
    dependancies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      require("dap-python").setup("python3")
    end
  },
}
