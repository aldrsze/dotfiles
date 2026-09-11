-- LSP setup using Neovim 0.11+ built-in API.
-- mason.nvim installs servers; vim.lsp.enable() activates them.

return {
  -- 1) Mason: installs language servers for you (no manual downloads)
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- 2) LSP config: enable the servers you want
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", name = "cmp_nvim_lsp" },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "ts_ls", "eslint", "html", "cssls", "lua_ls",
        "jdtls",       -- Java
        "clangd",      -- C / C++
        "omnisharp",   -- C#
        "pyright",     -- Python
        "sqlls",       -- SQL
        "tailwindcss", -- Tailwind CSS
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end
    end,
  },
}
