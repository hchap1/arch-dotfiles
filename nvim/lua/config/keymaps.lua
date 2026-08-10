-- Leader
vim.g.mapleader = " "

-- LSP related keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Diagnostics then docs
vim.keymap.set("n", "K", function()
  require("hover").open()
end, opts)

vim.keymap.set("n", "gK", function()
  require("hover").enter()
end, opts)

vim.keymap.set("n", "<C-p>", function()
  require("hover").switch("previous")
end, opts)

vim.keymap.set("n", "<C-n>", function()
  require("hover").switch("next")
end, opts)