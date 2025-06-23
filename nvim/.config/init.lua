require('user')
-- Add to your plugin spec in ~/.config/nvim/init.lua
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  },
  -- your other plugins...
}
