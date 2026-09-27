return {
    "saghen/blink.cmp",
    dependencies = {
        "saghen/blink.lib",
        "rafamadriz/friendly-snippets"
    },
    build = function()
        require("blink.cmp").build():pwait()
    end,

    ---@module "blink.cmp"
    ---@type blink.cmp.config

    opts = {
        keymap = {
            preset = "default",
            -- Tab/Shift-Tab cycle through the completion list (live-inserting the
            -- selected item as you go, thanks to auto_insert), falling back to
            -- snippet jumps and then normal Tab/Shift-Tab when no menu is open.
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            -- Accept the selected item (resolving + applying any
            -- additionalTextEdits, e.g. auto-inserting the import).
            ["<CR>"] = { "accept", "fallback" },
        },

        completion = {
            documentation = {
                auto_show = false
            },
            list = {
                selection = {
                    -- Don't auto-select the first item on open, so the first
                    -- <Tab> press locks onto it instead of skipping to #2.
                    preselect = false
                }
            }
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer"
            }
        },

        fuzzy = {
            implementation = "rust"
        }
    }
}