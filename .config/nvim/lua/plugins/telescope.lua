-- Fuzzy finder: find files, search text, browse buffers, etc.
-- This is your VSCode "Cmd+P" / "Cmd+Shift+F" replacement.
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search text in project" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List open buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
  },
}
