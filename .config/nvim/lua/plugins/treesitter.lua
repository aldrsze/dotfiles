-- Better syntax highlighting and indentation, based on real parsing
-- rather than regex. Add languages to the list as you need them.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    local parsers = {
      "javascript", "typescript", "tsx", "html", "css", "json",
      "lua", "markdown", "bash",
      "java", "c", "cpp", "c_sharp", "python", "sql",
    }
    local installed = require("nvim-treesitter.config").get_installed()
    for _, parser in ipairs(parsers) do
      if not vim.list_contains(installed, parser) then
        vim.cmd("TSInstall " .. parser)
      end
    end

    -- Enable treesitter highlighting per-buffer (avoids error on startup)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
