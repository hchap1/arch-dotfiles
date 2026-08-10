return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("basedpyright", { capabilities = capabilities })
    vim.lsp.config("ruff", { capabilities = capabilities })
    vim.lsp.config("tinymist", { capabilities = capabilities })
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    vim.lsp.config("clangd", { capabilities = capabilities })
    vim.lsp.enable({ "basedpyright", "ruff", "tinymist", "lua_ls", "clangd" })
  end,
}