return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  config = function()
    require("trouble").setup({
      icons = true,
      fold_open = "v",
      fold_closed = ">",
      indent_lines = true,
      auto_open = false,
      auto_close = true,
    })
  end,
}
