vim.lsp.enable("ccls")
vim.lsp.enable("nixd")
vim.lsp.enable("bashls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("jsonls")

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
   on_attach = function(client, bufnr)
      if not base_on_attach then return end

      base_on_attach(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = bufnr,
         command = "LspEslintFixAll",
      })
   end,
})

vim.lsp.config('lua_ls', {
   on_init = function(client)
      if client.workspace_folders then
         local path = client.workspace_folders[1].name
         if path ~= vim.fn.stdpath('config')
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
})

