return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  event = "VeryLazy",
  init = function()
    -- default visual mapping is "S"; use "ys" instead, to match normal mode
    vim.g.nvim_surround_no_visual_mappings = true
  end,
  config = function()
    require("nvim-surround").setup()
    vim.keymap.set("x", "ys", "<Plug>(nvim-surround-visual)", {
      desc = "Surround visual selection",
    })
  end,
}