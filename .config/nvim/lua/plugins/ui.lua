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
}
