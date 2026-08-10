return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "java",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "rust",
      "vim",
      "vimdoc",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
    require("nvim-treesitter").install(opts.ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}