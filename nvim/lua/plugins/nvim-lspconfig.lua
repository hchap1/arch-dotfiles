return {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Set up LSPs
        lspconfig.basedpyright.setup({ capabilities = capabilities })
        lspconfig.ruff.setup({ capabilities = capabilities })
        lspconfig.tinymist.setup({ capabilities = capabilities })
        lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
        })
        lspconfig.clangd.setup({ capabilities = capabilities })
    end
}