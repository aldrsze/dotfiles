-- Colorscheme. Swap this out anytime for something else (catppuccin, gruvbox, etc.)
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      theme = "wave",
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}
