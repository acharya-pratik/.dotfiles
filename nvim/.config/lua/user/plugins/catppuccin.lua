return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        telescope = true,
        treesitter = true,
        mason = true,
        neotree = true,
        -- lualine integration is handled by lualine.nvim
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
