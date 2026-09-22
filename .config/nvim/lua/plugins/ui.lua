-- Small UI niceties: a status line and git change markers in the gutter.
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({ options = { theme = "kanagawa" } })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true, -- shows +/-/~ in the gutter for git changes
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        }
    }
}
