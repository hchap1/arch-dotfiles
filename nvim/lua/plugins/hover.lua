return {
  "lewis6991/hover.nvim",
  event = "LspAttach",
  config = function()
    require("hover").setup({
      init = function()
        require("hover.providers.diagnostic")
        require("hover.providers.lsp")
      end,
      preview_opts = {
        border = "rounded",
      },
      preview_window = false,
      title = true,
    })
  end,
}