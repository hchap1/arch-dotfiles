local icons = {
  branch = "\u{e0a0}",
  lsp = "\u{f085}",
  clock = "\u{f017}",
  location = "\u{f041}",
  record = "\u{25cf}",
  unix = "\u{f17c}",
  dos = "\u{f17a}",
  mac = "\u{f179}",
}

local function lsp_clients()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    table.insert(clients, client.name)
  end
  if #clients == 0 then
    return ""
  end
  return icons.lsp .. " " .. table.concat(clients, ", ")
end

local function recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return icons.record .. " @" .. reg
end

local function clock()
  return icons.clock .. " " .. os.date("%R")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ok, palettes = pcall(require, "catppuccin.palettes")
    local colors = ok and palettes.get_palette("mocha") or {}

    require("lualine").setup({
      options = {
        theme = "catppuccin-mocha",
        globalstatus = true,
        icons_enabled = true,
        -- Slanted, borderless separators instead of hard pipes.
        component_separators = "",
        section_separators = { left = "\u{e0b8}", right = "\u{e0ba}" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = icons.branch },
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
          },
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = " \u{25cf}", readonly = " [RO]", unnamed = "[No Name]" },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.peach },
          },
        },
        lualine_x = {
          { recording, color = { fg = colors.red } },
          { lsp_clients, color = { fg = colors.blue } },
          "encoding",
          {
            "fileformat",
            symbols = { unix = icons.unix, dos = icons.dos, mac = icons.mac },
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", icon = icons.location },
          clock,
        },
      },
      extensions = { "lazy", "mason", "toggleterm" },
    })
  end,
}
