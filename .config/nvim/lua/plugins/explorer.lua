-- Sidebar file tree, like VSCode's Explorer panel.
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  },
  config = function()
    require("nvim-tree").setup({})
  end,
}
