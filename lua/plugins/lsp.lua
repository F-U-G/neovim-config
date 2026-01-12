-- for html formatting
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- These are for the lsp not in Mason and are installed via the OS
      vim.lsp.config(
        'clangd', {},
        'pyright', {
          -- npm i -g pyright
        },
        'gdscript', {
          --cmd = { 'nc', '127.0.0.1', '6005' },
          --filetypes = { 'gdscript' },
          --root_dir = lspconfig.util.root_pattern('project.godot', '.git'),
        },
        'tsserver', {
        },
        'html', {
          capabilities = capabilities,
        },
        'lua_ls', {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                  path ~= vim.fn.stdpath('config')
                  and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
              then
                return
              end
            end
            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT',
                path = {
                  'lua/?.lua',
                  'lua/?/init.lua',
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                }
              }
            })
          end,
          settings = {
            Lua = {}
          }
        }
      )
      vim.lsp.enable({ 'tailwindcss', 'cssls', 'biome', 'lua_ls', 'clangd', 'pyright', 'gdscript', 'ts_ls', 'eslint',
        'html', 'docker_compose_language_service', 'prismals', 'bashls', 'jdtls' })
    end,
  },
  {
    'mfussenegger/nvim-jdtls'
  }
}
