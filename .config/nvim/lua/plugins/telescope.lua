-- Fuzzy finder: find files, search text, browse buffers, etc.
-- This is your VSCode "Cmd+P" / "Cmd+Shift+F" replacement.
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Telescope" },
}
