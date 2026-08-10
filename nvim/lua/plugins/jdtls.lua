return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local jdtls = require("jdtls")
        local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
        local workspace_dir = vim.fn.stdpath("data")
          .. "/jdtls-workspace/"
          .. vim.fn.fnamemodify(root_dir or vim.fn.getcwd(), ":p:h:t")

        jdtls.start_or_attach({
          cmd = { "jdtls", "-data", workspace_dir },
          root_dir = root_dir,
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
      end,
    })
  end,
}