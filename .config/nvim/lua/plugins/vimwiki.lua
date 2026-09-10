return {
  "vimwiki/vimwiki",
  -- Load on specific keys or events to prevent slowing down Neovim startup
  keys = { "<leader>ww", "<leader>wt" },
  init = function()
    -- Configure Vimwiki options BEFORE the plugin loads
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/", -- Path to your wiki files
        syntax = "markdown", -- Use markdown syntax instead of default vimwiki syntax
        ext = ".md", -- Extension for your wiki files
      },
    }

    -- Optional: Prevent Vimwiki from treating all markdown files as wikis
    vim.g.vimwiki_global_ext = 0
  end,
}
