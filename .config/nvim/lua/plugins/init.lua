return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Correctly hooks back into NvChad's startup & restores the dashboard
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Load NvChad's default native/lsp definitions safely
      require("nvchad.configs.lspconfig").defaults()
      -- Load your personal LSP preferences
      require "configs.lspconfig"
    end,
  },

  -- NvChad's new blink completion spec
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "c_sharp",
        "markdown",
        "markdown_inline",
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "quarto" },
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
      config = function()
        require("render-markdown").setup {}
      end,
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = "cd app && npm install",
    },
  },
}
