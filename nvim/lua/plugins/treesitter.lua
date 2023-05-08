return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "lua",
                "python",
                "rust",
                "bash",
                "html",
                "markdown",
                "markdown_inline",
                "regex",
                "tsx",
                "typescript",
                "yaml"
            },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        },
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {"nvim-treesitter/playground"}
}
