return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        picker = { enabled = true }
    },

    init = function()
        vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()

            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...)
            Snacks.debug.inspect(...)
            end
            _G.bt = function()
            Snacks.debug.backtrace()
            end

            -- Override print to use snacks for `:=` command
            if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
                dd(...)
            end
            else
            vim.print = _G.dd
            end
        end,
        })
    end
}