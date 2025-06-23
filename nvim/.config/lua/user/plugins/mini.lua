return {
  "echasnovski/mini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- mini.comment: Commenting with gcc/gc
    require("mini.comment").setup({
      mappings = {
        comment = "<leader>/",        -- Use <leader>/ for commenting
        comment_line = "<leader>/",   -- Toggle line comment
        comment_visual = "<leader>/", -- Toggle visual selection comment
      },
    })

    -- mini.pairs: Auto-pairing brackets, quotes, etc.
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
      },
    })
  end,
}
