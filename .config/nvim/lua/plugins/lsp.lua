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

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gr", vim.lsp.buf.references, "Go to references")
          map("n", "K", vim.lsp.buf.hover, "Hover docs")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
          map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
        end,
      })

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
