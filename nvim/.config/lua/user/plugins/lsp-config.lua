return {
  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "jedi_language_server",
          "clangd",
          "ts_ls",
          "eslint",
          "sqlls",
          "bashls",
          "dockerls",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  -- LSP config
  {
"neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, "blink.cmp") then
        capabilities = require("blink.cmp").get_lsp_capabilities()
      end

      local lspconfig = require("lspconfig")
      -- Python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = { autoImportCompletion = true },
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
            },
          },
        },
      })

      -- C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })

      -- SQL
      lspconfig.sqlls.setup({
        capabilities = capabilities,
      })

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.server_capabilities.hoverProvider then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
          end
        end,
      })
    end,
  },
}
