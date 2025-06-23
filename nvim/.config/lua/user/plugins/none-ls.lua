return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
  config = function()
    local null_ls = require("null-ls")
    require("mason-null-ls").setup({
      ensure_installed = { "black", "isort", "prettier", "stylua", "shfmt" },
      automatic_installation = true,
    })
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
      },
    })
  end,
}
