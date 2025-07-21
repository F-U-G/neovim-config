return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          --stopAtEntry = true,
          stopAtBeginningOfMainSubprogram = true,
        },
      }
      vim.keymap.set('n', '<Leader>b', function() require("dap").toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>B', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
      vim.keymap.set('n', '<Leader>c', function() require("dap").continue() end)
      vim.keymap.set('n', '<Leader>so', function() require("dap").step_over() end)
      vim.keymap.set('n', '<Leader>si', function() require("dap").step_into() end)
      vim.keymap.set('n', '<Leader>su', function() require("dap").step_out() end)
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

      vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)
      vim.keymap.set('n', '<Leader>de', function() dapui.eval() end)

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
}
