return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- hover.nvim handles on-demand hover docs; let noice own signature
      -- help so it can pop up automatically while typing args in a call.
      hover = { enabled = false },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true, -- open as soon as a trigger char (e.g. "(", ",") is typed
          luasnip = true,
          throttle = 50,
        },
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      command_palette = true, -- centered cmdline + popupmenu
      long_message_to_split = true,
      lsp_doc_border = false,
    },
  },
}
