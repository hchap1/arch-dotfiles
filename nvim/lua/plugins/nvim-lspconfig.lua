return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("basedpyright", {
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            -- autoImportCompletions does a workspace-wide symbol search
            -- (scanning every installed package) on every keystroke to
            -- offer auto-import suggestions — this is what makes
            -- completion popups take 1-2s. ruff already handles import
            -- sorting/unused-import fixes, so we don't lose much.
            autoImportCompletions = false,
            -- Only type-check open buffers instead of the whole
            -- workspace/venv up front.
            diagnosticMode = "openFilesOnly",
          },
        },
      },
    })
    vim.lsp.config("ruff", { capabilities = capabilities })
    -- exportPdf defaults to "onSave", which runs a full typst compile
    -- (CPU-heavy) on every write; typst-preview.nvim already covers live
    -- preview, so skip it.
    vim.lsp.config("tinymist", { capabilities = capabilities, settings = { exportPdf = "never" } })
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
